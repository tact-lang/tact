struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Int?;
    g: Address;
}

contract DeepNestedTest {
    nest: Nested;

    init() {
        self.nest = Nested{
            inner: InnerStruct{
                a: 1,
                b: true,
                c: emptyCell(),
                d: emptyCell().asSlice(),
                e: "Hi",
                f: null,
                g: myAddress(),
            }
        };
    }
}