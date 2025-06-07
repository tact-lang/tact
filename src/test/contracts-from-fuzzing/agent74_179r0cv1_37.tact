struct Inner {
    num: Int;
    flag: Bool;
    addr: Address;
}

struct Wrapper {
    label: String;
    payload: Cell;
    code: Slice;
    nested: Inner;
}

contract TestContract {
    complex: Wrapper;
    init() {
        self.complex = Wrapper{
            label: "hi",
            payload: emptyCell(),
            code: emptyCell().asSlice(),
            nested: Inner{ num: 789, flag: false, addr: myAddress() }
        };
    }
}