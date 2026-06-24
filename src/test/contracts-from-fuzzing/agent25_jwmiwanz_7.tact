struct WithManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
    optInt: Int?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    flag: Bool;
}

contract ManyTypesStorage {
    data: WithManyTypes;

    init() {
        self.data = WithManyTypes{
            i: 1,
            b: true,
            s: "h",
            c: emptyCell(),
            addr: myAddress(),
            optInt: null,
            optAddr: null,
            optStr: null,
            optCell: null,
            flag: false
        };
    }
}
