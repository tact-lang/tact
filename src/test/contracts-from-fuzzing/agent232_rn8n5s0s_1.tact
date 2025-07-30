struct Nested {
    x: Int;
    y: Bool;
    addr: Address;
    
    optInt: Int?;
    optAddr: Address?;
}

contract TestDeep {
    field: Nested;
    flag: Bool = false;

    init() {
        self.field = Nested{
            x: 100,
            y: true,
            addr: myAddress(),
            optInt: null,
            optAddr: null,
        };
        self.flag = true;
    }
}