struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

struct Container {
    a: Int;
    nest: NestedStruct;
}

contract NestedInContainer {
    data: Container;

    init() {
        self.data = Container{ a: 5, nest: NestedStruct{ x:1, y:true, z:"abc" } };
    }
}