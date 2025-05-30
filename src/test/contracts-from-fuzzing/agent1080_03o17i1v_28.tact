struct Mixed {
 a: Int;
 b: Bool?;
 c: String;
 d: String?;
 e: Cell;
 f: Cell?;
 g: Slice;
 h: Slice?;
 i: Address;
 j: Address?;
}

contract MixTest {
 data: Mixed;

 init() {
   self.data = Mixed{
     a: 1,
     b: null,
     c: "a",
     d: null,
     e: emptyCell(),
     f: null,
     g: emptyCell().asSlice(),
     h: null,
     i: myAddress(),
     j: null,
   };
 }
}