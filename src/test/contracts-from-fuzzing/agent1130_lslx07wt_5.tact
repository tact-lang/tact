struct ManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
    optI: Int?;
    optAddr: Address?;
    optCell: Cell?;
}

contract ManyTypesContract {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: 1,
            b: false,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "hello",
            optI: null,
            optAddr: null,
            optCell: null
        };
    }
}