// Very deep persistent state with many optionals
contract ManyOptsFields {
  a: Int?; b: Int; c: Bool?; d: Bool; e: Address?; f: Address; g: String?; h: String;

  init() {
    self.a = null;
    self.b = 1;
    self.c = null;
    self.d = true;
    self.e = null;
    self.f = myAddress();
    self.g = null;
    self.h = "hi";
  }
}