struct MixedStruct {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    bu: Builder;
    st: String;
}

contract MixedContract {
    data: MixedStruct;
    init() {
        self.data = MixedStruct{
            i: 42,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            bu: beginCell(),
            st: "hi"
        };
    }
}
