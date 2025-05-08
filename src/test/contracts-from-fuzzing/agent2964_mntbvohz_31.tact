struct Tup {
 a: Int;
 b: Bool;
 c: String;
}

contract ManyVars {
 v1: Tup;
 v2: Tup;
 v3: Tup;
 v4: Tup;

 init() {
   self.v1 = Tup{a:1,b:true,c:"a"};
   self.v2 = Tup{a:2,b:false,c:"b"};
   self.v3 = Tup{a:3,b:true,c:"c"};
   self.v4 = Tup{a:4,b:false,c:"d"};
 }
}
