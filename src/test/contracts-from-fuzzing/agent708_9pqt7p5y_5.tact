struct DeepNestA {
    val: Int;
}

struct DeepNestB {
    a: DeepNestA;
    flag: Bool;
}

struct DeepNestC {
    b: DeepNestB;
    text: String;
}

struct DeepNestD {
    c: DeepNestC;
    addr: Address;
}

contract DeepNestContract {
    d: DeepNestD;

    init() {
        self.d = DeepNestD{
            c: DeepNestC{
                b: DeepNestB{
                    a: DeepNestA{ val: 1 },
                    flag: true
                },
                text: "hi"
            },
            addr: myAddress()
        };
    }
}
