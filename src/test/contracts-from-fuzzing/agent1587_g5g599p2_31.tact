struct MidStruct {
    foo: Int;
    bar: Bool;
}

struct OuterStruct {
    x: Int; 
    y: String;
    nested: MidStruct;
    flag: Bool?;
}

contract NestedMix {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            x: 1,
            y: "abc",
            nested: MidStruct{ foo: 42, bar: false },
            flag: null
        };
    }
}