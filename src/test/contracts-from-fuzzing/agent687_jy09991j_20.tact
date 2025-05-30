struct ComposeMulti {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
}

contract MultiField {
    val: ComposeMulti;
    flag: Bool;
    id: Int;
    greeting: String;

    init() {
        self.val = ComposeMulti{
            foo: 1,
            bar: false,
            baz: "hi",
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice()
        };
        self.flag = true;
        self.id = 42;
        self.greeting = "hello";
    }
}