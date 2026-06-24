struct Bunch {
    i1: Int;
    str1: String;
    c1: Cell;
    s1: Slice;
    addr1: Address;
    opt1: Int?;
    opt2: String?;
}

contract MixedTypes {
    val: Bunch;

    init() {
        self.val = Bunch{
            i1: 42,
            str1: "hello",
            c1: emptyCell(),
            s1: emptyCell().asSlice(),
            addr1: myAddress(),
            opt1: null,
            opt2: null
        };
    }
}