struct OptionalLayer {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptTest {
  optVals: OptionalLayer = OptionalLayer{ a: null, b: null, c: null };
}