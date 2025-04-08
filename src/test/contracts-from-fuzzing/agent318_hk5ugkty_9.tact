struct Wrapper {
    inner1: Int;
    inner2: Int?;
    inner3: Bool;
    inner4: String;
    inner5: Slice;
    inner6: Address;
    inner7: Bool?;
}

contract MultiTypeNested {
    nested: Wrapper;

    init() {
        self.nested = Wrapper{
            inner1: 12,
            inner2: null,
            inner3: true,
            inner4: "hey",
            inner5: emptyCell().asSlice(),
            inner6: myAddress(),
            inner7: false
        };
    }
}