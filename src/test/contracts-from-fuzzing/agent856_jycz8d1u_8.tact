struct NestedStringInner {
    foo: String;
    bar: Bool;
}

struct NestedStringOuter {
    inner: NestedStringInner;
    note: String;
}

contract StringStructStorage {
    data: NestedStringOuter;

    init() {
        self.data = NestedStringOuter{
            inner: NestedStringInner{
                foo:"Hi!", bar:true
            },
            note: "Outer"
        };
    }
}