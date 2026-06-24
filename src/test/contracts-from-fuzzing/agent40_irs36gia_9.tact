struct MyStruct {
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
}

contract OptionalsInStruct {
    s: MyStruct;

    init() {
        self.s = MyStruct{
            optInt: null,
            optStr: null,
            optAddr: null,
            optCell: null
        };
    }
}