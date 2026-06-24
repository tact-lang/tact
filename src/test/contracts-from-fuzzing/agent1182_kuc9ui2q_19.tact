struct Rec {
 a: Int;
 b: Bool;
 s: String;
}

contract NegDefaults {
 x: Rec = Rec{ a: -42, b: false, s: "neg" };

 init() {
   self.x = Rec{ a: -99, b: true, s: "changed" };
 }
}
