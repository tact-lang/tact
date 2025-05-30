struct SomeStruct {
    flag: Bool;
    value: Int as uint8;
    payload: Cell;
    address: Address;
    optionalInt: Int?;
}

contract MixedTypes {
    s: SomeStruct;

    init() {
        self.s = SomeStruct{
            flag: true,
            value: 42,
            payload: emptyCell(),
            address: myAddress(),
            optionalInt: null
        };
    }
}