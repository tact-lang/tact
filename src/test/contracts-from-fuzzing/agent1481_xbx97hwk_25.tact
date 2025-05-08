// Struct with many nullable primitives mixed
struct NullMix {
  one: Int?;
  two: Bool?;
  three: Address?;
  four: Cell?;
  five: Slice?;
  six: String?;
}

contract NullMixTest {
  mixed: NullMix;
  init() {
    self.mixed = NullMix{one:null,two:null,three:null,four:null,five:null,six:null};
  }
}