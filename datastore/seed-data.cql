// delete all seed data
MATCH (n)
OPTIONAL MATCH (n)-[r]-()
DELETE n,r;

// create some consultants
CREATE (:Consultant {firstName:"War", lastName:"Sla", phone:"0407111222", email:"war.sla@smsmt.com", employeeId:"2401"})
CREATE (:Consultant {firstName:"Ada", lastName:"Roz", phone:"0417222333", email:"ada.roz@smsmt.com", employeeId:"2405"})
CREATE (:Consultant {firstName:"Fad", lastName:"Sud", phone:"0411333444", email:"fad.sud@smsmt.com", employeeId:"2402"})
CREATE (:Consultant {firstName:"And", lastName:"Hit", phone:"0400444555", email:"and.hit@smsmt.com", employeeId:"2403"})
CREATE (:Consultant {firstName:"Tom", lastName:"Sti", phone:"0400555666", email:"tom.sti@smsmt.com", employeeId:"2404"});
CREATE (:Consultant {firstName:"Dav", lastName:"Car", phone:"0400666777", email:"dav.car@smsmt.com", employeeId:"2406"});
CREATE (:Consultant {firstName:"Ant", lastName:"Pas", phone:"0400777888", email:"ant.pas@smsmt.com", employeeId:"2407"});
CREATE (:Consultant {firstName:"Sha", lastName:"Gri", phone:"0400888999", email:"sha.gri@smsmt.com", employeeId:"2408"});
CREATE (:Consultant {firstName:"Hen", lastName:"Niu", phone:"0400999000", email:"hen.niu@smsmt.com", employeeId:"2409"});

// create some clients
CREATE (:Client {name:"Telstra", contact:"John Brown", clientCode:"123"})
CREATE (:Client {name:"Australia Post", contact:"Peter Green", clientCode:"456"});
CREATE (:Client {name:"ANZ", contact:"Jim Black", clientCode:"789"});
CREATE (:Client {name:"Sensis", contact:"Mouse Cyan", clientCode:"189"});
CREATE (:Client {name:"Westpac", contact:"Mary Pink", clientCode:"143"});

// create some moods
CREATE (:Mood {name:"livingTheDream", description:"living the dream", rating:toInt(100)});
CREATE (:Mood {name:"happy", description:"I am enjoying myself right about now", rating:toInt(90)})
CREATE (:Mood {name:"indifferent", description:"just doing my thang - nothing good to report, nothing bad to report", rating:toInt(70)});
CREATE (:Mood {name:"bored", description:"this place is doing nothing for me - think i might go surf SEEK", rating:toInt(50)})
CREATE (:Mood {name:"postal", description:"I cant take this sh!t anymore", rating:toInt(0)})

// create engagements
CREATE (:Engagement {name:"Contact Centre Optimisiation", Client:"Telstra"})
CREATE (:Engagement {name:"First Contact Optimisiation", Client:"Telstra"})
CREATE (:Engagement {name:"Cloud Migration", Client:"Australia Post"});
CREATE (:Engagement {name:"Financial Services", Client:"ANZ"});
CREATE (:Engagement {name:"SDF", Client:"Sensis"});
CREATE (:Engagement {name:"Morph", Client:"Sensis", completed:true});
CREATE (:Engagement {name:"Financial Packages", Client:"Westpac"});

// link the engagements to clients
MATCH (e:Engagement),(c:Client)
WHERE c.name="Telstra" AND e.name="Contact Centre Optimisiation"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="Telstra" AND e.name="First Contact Optimisiation"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="Australia Post" AND e.name="Cloud Migration"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="ANZ" AND e.name="Financial Services"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="Sensis" AND e.name="SDF"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="Sensis" AND e.name="Morph"
CREATE (e)-[r:with]->(c);

MATCH (e:Engagement),(c:Client)
WHERE c.name="Westpac" AND e.name="Financial Packages"
CREATE (e)-[r:with]->(c);

// link the consultants to engagements
match (c:Consultant),(e:Engagement)
where c.employeeId = "2401" AND e.name="SDF"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2405" AND e.name="Contact Centre Optimisiation"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2402" AND e.name="Contact Centre Optimisiation"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2403" AND e.name="First Contact Optimisiation"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2404" AND e.name="First Contact Optimisiation"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2404" AND e.name="Cloud Migration"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2406" AND e.name="Financial Packages"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2407" AND e.name="Financial Packages"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2408" AND e.name="Financial Packages"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2409" AND e.name="Morph"
create (c)-[:engagedOn]->(e);

match (c:Consultant),(e:Engagement)
where c.employeeId = "2409" AND e.name="SDF"
create (c)-[:engagedOn]->(e);
