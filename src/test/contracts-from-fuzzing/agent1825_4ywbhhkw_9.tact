struct StructA {
    val1: Int;
}

struct StructB {
    a: StructA;
    num: Int;
}

struct StructC {
    b: StructB;
    text: String;
}

struct StructD {
    c: StructC;
    flag: Bool;
}

contract ChainStruct {
    chain: StructD;
    init() {
        self.chain = StructD{
            c: StructC{
                b: StructB{
                    a: StructA{val1:314},
                    num:42
                },
                text:"nested"
            },
            flag: true
        };
    }
}
