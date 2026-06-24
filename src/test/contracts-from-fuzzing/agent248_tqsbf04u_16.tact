struct DeepA {
    u: Int = 1;
    v: Bool? = null;
    w: String = "x";
}

struct DeepB {
    a: DeepA;
    n: String? = null;
}

struct DeepC {
    b: DeepB;
    flag: Bool = true;
}

contract VeryDeepDefaults {
    val: DeepC;

    init() {
        self.val = DeepC{
            b: DeepB{
                a: DeepA{}, // rely on defaults
                n: "note"
            },
            flag: false
        };
    }
}