struct StructA {
    flag: Bool;
    nested: StructB;
}

struct StructB {
    flag: Bool;
    nested: StructC;
}

struct StructC {
    flag: Bool;
    nested: StructD;
}

struct StructD {
    flag: Bool;
}

contract TestContract {
    tree: StructA;

    init() {
        self.tree = StructA{
            flag: true,
            nested: StructB{
                flag: false,
                nested: StructC{
                    flag: true,
                    nested: StructD{
                        flag: false
                    }
                }
            }
        };
    }
}
