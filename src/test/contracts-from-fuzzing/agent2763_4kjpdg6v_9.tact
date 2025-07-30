struct A { x: Int }
struct B { y: Int }

struct Big {
  f1: Int; f2: Bool; f3: Address; f4: String;
  s1: A; s2: B;
  optS1: A?; optS2: B?;
  optInt: Int?; optBool: Bool?; optAddr: Address?; optString: String?;
}

contract MixedFields {
  data: Big;

  init() {
    self.data = Big{
      f1: 1, f2: true, f3: myAddress(), f4: "hello",
      s1: A{x: 10}, s2: B{y: 20},
      optS1: null, optS2: null,
      optInt: null, optBool: null, optAddr: null, optString: null,
    };
  }
}