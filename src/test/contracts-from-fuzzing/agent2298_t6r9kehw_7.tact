struct Child {
    z: Int;
}

struct Parent {
    x: Int;
    y: Child;
}

struct GrandParent {
    info: Parent;
    extra: Int;
}

contract MultiLevel {
    data: GrandParent;

    init() {
        self.data = GrandParent{
            info: Parent{
                x: 1,
                y: Child { z: 2 }
            },
            extra: 3,
        };
    }
}