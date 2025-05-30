struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterStruct {
    x: Int;
    y: InnerStruct;
    z: Int?;
}

contract NestedStructsTest {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            x: 1,
            y: InnerStruct{
                a: 10,
                b: true,
                c: "hello",
            },
            z: null,
        };
    }
}