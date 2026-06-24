struct StructA {
    x: Int;
}

struct StructB {
    s: StructA;
}

struct StructC {
    t: StructB;
}

contract TestContract {
    item: StructC;

    init() {
        self.item = StructC{
            t: StructB{
                s: StructA{
                    x: 42
                }
            }
        };
    }
}