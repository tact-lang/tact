struct DefaultStruct {
    a: Int = 1;
    b: String = "hi";
    c: Address;
}

contract Defaults {
    val: DefaultStruct;

    init() {
        self.val = DefaultStruct {
            c: myAddress()
        };
    }
}