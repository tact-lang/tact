struct Complex {
    flag: Bool;
    count: Int;
    label: String;
    data: Cell;
    code: Cell;
    sender: Address;
    text: String;
    slice: Slice;
}

contract TestContract {
    state: Complex;

    init() {
        self.state = Complex{
            flag: true,
            count: 1,
            label: "test",
            data: emptyCell(),
            code: emptyCell(),
            sender: myAddress(),
            text: "foo",
            slice: emptyCell().asSlice()
        };
    }
}