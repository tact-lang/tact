struct Complex {
  f1: Int; f2: Bool; f3: String; f4: Int?; f5: Bool?;
  f6: Int; f7: Bool; f8: String; f9: Int?; f10: Bool?;
}

contract ManyMix {
  data: Complex = Complex{
    f1: 1, f2: true, f3: "a", f4: null, f5: false,
    f6: 2, f7: false, f8: "b", f9: null, f10: true
  };
}