struct NestedMix1 {
  foo: Int;
  flag: Bool;
}

struct NestedMix2 {
  s: String;
  inner: NestedMix1;
}

contract TestStorage {
  nmix: NestedMix2;

  init() {
    self.nmix = NestedMix2{
      s: "nested",
      inner: NestedMix1{ foo: 55, flag: true }
    };
  }
}