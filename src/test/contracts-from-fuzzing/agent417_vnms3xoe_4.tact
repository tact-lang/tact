struct A {
    int1: Int;
    bool1: Bool;
    addr: Address;
    sl: Slice;
    cl: Cell;
    s: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optStr: String?;
}

contract C {
    val: A;
    init() {
        self.val = A{
            int1: 1,
            bool1: true,
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            s: "hello",
            optInt: null,
            optBool: false,
            optAddr: null,
            optSlice: null,
            optCell: null,
            optStr: "",
        };
    }
}