struct NestedStruct {
    a: Int = 7;
    b: Bool = false;
    c: Address;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            c: myAddress()
        };
    }
}
