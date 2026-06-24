struct Inner {
    s: String;
    i: Int?;
}

struct Outer {
    outerInt: Int;
    innerStruct: Inner;
    anotherInt: Int;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            outerInt: 10,
            innerStruct: Inner{
                s: "hello",
                i: null
            },
            anotherInt: 20
        };
    }
}
