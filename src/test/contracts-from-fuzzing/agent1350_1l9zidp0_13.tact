struct NestedStruct {
    flag: Bool;
    id: Int as uint32;
}

struct Container {
    n: NestedStruct?;
    tag: String;
}

contract DefaultSome {
    cont: Container = Container{
        n: NestedStruct{ flag: true, id: 0xdeadbeef },
        tag: "tagged"
    };

    init() {
        self.cont = Container{
            n: null,
            tag: "updated"
        };
    }
}