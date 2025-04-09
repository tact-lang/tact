struct MultiTypeContainer {
    n: Int;
    flag: Bool;
    addr: Address;
    data: Cell;
    slice: Slice;
    builder: Builder;
    str: String;
}

contract MultiTypeFieldsTest {
    storage: MultiTypeContainer;

    init() {
        self.storage = MultiTypeContainer{
            n: 100,
            flag: false,
            addr: myAddress(),
            data: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell(),
            str: "hello",
        };
    }
}