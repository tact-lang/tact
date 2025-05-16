struct DefaultsStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract DefaultsInStruct {
    val: DefaultsStruct;

    init() {
        self.val = DefaultsStruct{
            d: myAddress()
        };
    }
}