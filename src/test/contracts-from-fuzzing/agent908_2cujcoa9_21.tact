struct DefaultsStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Address?;
}

contract StructDefaultsOmit {
    val: DefaultsStruct;

    init() {
        self.val = DefaultsStruct{ d: null }; // omit a,b,c since they have defaults
    }
}