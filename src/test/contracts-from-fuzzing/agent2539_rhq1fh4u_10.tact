struct S1 {
 x: Int;
}

struct S2 {
 y: Int;
}

struct S3 {
 z: Int;
}

contract ManyStructFields {
 field1: S1;
 field2: S2;
 field3: S3;

 init() {
  self.field1 = S1{x:11};
  self.field2 = S2{y:22};
  self.field3 = S3{z:33};
 }
}