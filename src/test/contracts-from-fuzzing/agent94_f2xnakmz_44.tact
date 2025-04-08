struct PrimMix {
 a: Int;
 b: Bool;
 c: String;
 d: Address;
 e: Cell;
 f: Slice;
}

contract PrimMixTest {
 data: PrimMix;

 init() {
  self.data = PrimMix{
    a: 42, b: true, c: "test", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice()
  };
 }
}