struct Sub1 { a: Int; b: Bool; }
struct Sub2 { s: Sub1; c: String; }
struct Sub3 { s2: Sub2; d: String; }

contract MixedDeepStructs {
    data: Sub3;

    init() {
        self.data = Sub3{
            s2: Sub2{
                s: Sub1{ a: 1, b: false },
                c: "abc"
            },
            d: "def"
        };
    }
}