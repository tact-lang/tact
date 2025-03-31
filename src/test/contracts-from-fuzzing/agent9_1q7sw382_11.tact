struct ComplexData {
    num: Int;
    optStr: String?;
    flags: map<Int, Bool>;
}

contract ComplexGetter {
    num: Int = 100;
    str: String? = "Hello";
    flags: map<Int, Bool> = emptyMap();

    init() {
        // Set a flag for testing
        self.flags.set(1, true);
    }

    receive() {}

    get fun getComplex(): ComplexData {
        return ComplexData{
            num: self.num,
            optStr: self.str,
            flags: self.flags
        };
    }
}
