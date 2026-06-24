struct ManyFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "x";
    f4: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f5: Int = 2;
    f6: Bool = false;
    f7: String = "y";
    f8: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f9: Int = 3;
    f10: Bool = true;
}

contract WideStructContract {
    bigStruct: ManyFields;

    init() {
        self.bigStruct = ManyFields{
            f1: 10, f2: false, f3: "a", f4: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f5: 11, f6: true, f7: "b", f8: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f9: 12, f10: false
        };
    }
    receive(){}
}