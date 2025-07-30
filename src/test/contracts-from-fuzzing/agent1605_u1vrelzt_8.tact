struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;
}

contract TestContract {
    m: ManyTypes;

    init() {
        self.m = ManyTypes{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optString: null,
            optAddr: null
        };
    }

    receive() {
        self.m = ManyTypes{
            i: 2,
            b: false,
            s: "bye",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            optInt: 3,
            optBool: true,
            optString: "ok",
            optAddr: myAddress()
        };
    }
}