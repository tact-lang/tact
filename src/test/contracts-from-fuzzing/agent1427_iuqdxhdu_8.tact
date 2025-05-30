struct ComplexStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Slice;
    f: Cell;
}

struct WrapperStruct {
    inner: ComplexStruct?;
    text: String;
}

contract ComplexOptionalNested {
    data: WrapperStruct;
    init() {
        self.data = WrapperStruct{
            inner: ComplexStruct {
                a: 123,
                b: false,
                c: "abc",
                d: null,
                e: emptyCell().asSlice(),
                f: emptyCell()
            },
            text: "wrapper"
        };
    }
}