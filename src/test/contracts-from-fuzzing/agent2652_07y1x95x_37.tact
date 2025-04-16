struct S1 {a:Int;}
struct S2 {x:S1;}
struct S3 {y:S2;}
struct S4 {z:S3;}
contract Deep4Levels {
 s: S4;
 init() {
  self.s = S4{ z: S3{ y: S2{ x: S1{ a:5 } } } };
 }
}