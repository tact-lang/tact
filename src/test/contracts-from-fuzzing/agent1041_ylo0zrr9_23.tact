struct DeepCombo {
    a: Block1;
}

struct Block1 {
    b: Block2;
    flag: Bool;
}

struct Block2 {
    c: Block3?;
    txt: String;
}

struct Block3 {
    number: Int;
    flag2: Bool?;
    innerStr: String?;
}

contract DeepMixed {
    nested: DeepCombo;

    init() {
        self.nested = DeepCombo{
            a: Block1{
                b: Block2{
                    c: Block3{
                        number: 7,
                        flag2: null,
                        innerStr: null
                    },
                    txt: "hi"
                },
                flag: false
            }
        };
    }
}
