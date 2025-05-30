struct Sub {
 x: Int;
 y: String;
}

contract ManyOptionalSubs {
 s1: Sub?;
 s2: Sub?;
 s3: Sub?;
 s4: Sub?;

 init() {
   self.s1 = null;
   self.s2 = Sub{ x: 1, y: "a" };
   self.s3 = null;
   self.s4 = Sub{ x: 2, y: "b" };
 }
}