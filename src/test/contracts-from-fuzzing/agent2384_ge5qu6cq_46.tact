struct LargeNested {
    a: Int;
    nested: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Bool;
    z: String;
}

contract LargeNestedTest {
    state: LargeNested;

    init() {
        self.state = LargeNested{
            a: 1,
            nested: InnerNested{x:2,y:true,z:"hello"}
        };
    }
}