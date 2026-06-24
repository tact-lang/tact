struct Child {
    aa: Int;
    bb: Bool;
}

struct Parent {
    x: Int;
    child: Child;
    y: Bool;
}

contract MiddleFieldStruct {
    stored: Parent;
    init() {
        self.stored = Parent{
            x: 5,
            child: Child{
                aa: 12,
                bb: false,
            },
            y: true,
        };
    }
}