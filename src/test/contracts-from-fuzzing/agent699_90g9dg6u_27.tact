struct Struct1 { x: Int; s: String; }
struct Struct2 { flag: Bool; opt: Int?; }

contract MixedStructs {
    a: Struct1;
    b: Struct2;

    init() {
        self.a = Struct1{ x: 123, s: "sss" };
        self.b = Struct2{ flag: true, opt: null };
    }
}
