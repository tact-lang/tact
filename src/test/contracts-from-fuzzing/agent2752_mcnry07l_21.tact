struct BigStruct {
    f0: Int = 0;
    f1: Bool = true;
    f2: String = "a";
    f3: Address;
    f4: Int = 4;
    f5: Bool = false;
    f6: String = "b";
    f7: Address;
    f8: Int = 8;
    f9: Bool = true;
}

contract StructVarietyInit {
    big: BigStruct;
    init() {
        self.big = BigStruct{
            f3: myAddress(),
            f7: myAddress()
        };
    }
}