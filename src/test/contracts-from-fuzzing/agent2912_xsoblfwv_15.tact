struct VariousSerialized {
 x: Int as uint4;
 y: Int as int32;
 z: Int as uint64;
 big: Int as int257;
}

contract SerializeTest {
 s: VariousSerialized;
 init() {
   self.s = VariousSerialized{ x:7, y:100, z:200, big:300 };
 }
}