struct S1 { x: Int; y: Int; z: Int }
struct S2 { a: Int; b: Int; c: Int }

contract WidePersistent {
  s1: S1;
  s2: S2;
  s3: S1;
  s4: S2;
  s5: S1;
  s6: S2;

  init() {
    self.s1 = S1{x:1,y:2,z:3};
    self.s2 = S2{a:4,b:5,c:6};
    self.s3 = S1{x:7,y:8,z:9};
    self.s4 = S2{a:10,b:11,c:12};
    self.s5 = S1{x:13,y:14,z:15};
    self.s6 = S2{a:16,b:17,c:18};
  }
}