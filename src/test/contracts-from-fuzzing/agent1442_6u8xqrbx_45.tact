// deep optional chain mixed with defaulted structs
struct Last {x:Int=1;}
struct Mid {val:Last?=null;}
struct Root {m:Mid?=null;}

contract TestContract {
    r:Root;
    init() { self.r=Root{}; }
}