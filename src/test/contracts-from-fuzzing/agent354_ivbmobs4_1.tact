struct DeepInner {
    a: Int;
    b: String?;
}

struct MidStruct {
    d: DeepInner;
    e: Int;
}

struct OuterStruct {
    f: MidStruct;
    g: Bool;
    h: String;
}

contract DeepNestedTest {
    foo: OuterStruct;
    
    init() {
        self.foo = OuterStruct{
            f: MidStruct{
                d: DeepInner{a: 42, b: null},
                e: 13
            },
            g: false,
            h: "test"
        };
    }
}