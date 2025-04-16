struct Base {
    x: Int;
}

struct WithBase {
    base: Base;
    y: Int;
}

contract StructInStruct {
    data: WithBase;

    init() {
        self.data = WithBase{
            base: Base{ x: 33 },
            y: 44
        };
    }
}