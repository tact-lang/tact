struct NestedStruct {
    x: Int;
    y: Bool?;
    z: String;
}

struct OuterStruct {
    s: NestedStruct;
    t: String;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            s: NestedStruct{ x: 10, y: null, z: "abc" },
            t: "outer"
        };
    }
}