struct ManyTypes {
    flag: Bool;
    num: Int;
    addr: Address;
    data: Cell;
    slice: Slice;
    str: String;
}

contract MixedTypes {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            flag: true, num: 123, addr: myAddress(),
            data: emptyCell(), slice: emptyCell().asSlice(), str: "hi"
        };
    }
}