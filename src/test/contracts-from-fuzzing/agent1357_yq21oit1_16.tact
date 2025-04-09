struct MixedTypes {
  n: Int;
  f: Bool;
  s: String;
  addr: Address?;
}

contract MixedComposite {
  mix: MixedTypes = MixedTypes{ n: 111, f: false, s: "test", addr: null };
}