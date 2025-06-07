struct DeepA {
    next: DeepB;
    val: Int;
}

struct DeepB {
    next: DeepC;
    flag: Bool;
}

struct DeepC {
    str: String;
}

contract DeepStructure {
    stored: DeepA;

    init() {
        self.stored = DeepA {
            next: DeepB {
                next: DeepC { str: "hello" },
                flag: true
            },
            val: 111
        };
    }

    receive() {}
}