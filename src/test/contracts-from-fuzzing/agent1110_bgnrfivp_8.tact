struct StructA {
 x: Int;
 y: Int;
}

struct StructB {
 z: Int;
 a: StructA;
}

struct StructC {
 b: StructB;
 msg: String;
}

contract MultiLevel {
   val: StructC;

   init() {
     self.val = StructC{
       b: StructB{ z: 5, a: StructA{ x: 1, y: 2 } },
       msg: "test"
     };
   }
}