contract LargeFlatStorage {
    f1: Int; f2: Bool; f3: String; f4: Bool?; f5: Int?;
    f6: String?; f7: Int; f8: Bool; f9: String; f10: Bool?;
    f11: Int?; f12: String?; f13: Int; f14: Bool; f15: String;

    init() {
        self.f1 = 1;  self.f2 = true;  self.f3 = "a";    self.f4 = null;   self.f5 = null;
        self.f6 = null; self.f7 = 7;    self.f8 = false;  self.f9 = "b";     self.f10 = false;
        self.f11 = 42;  self.f12 = null; self.f13 = 13;    self.f14 = true;   self.f15 = "end";
    }
}