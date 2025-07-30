// contract with >20 persistent fields of mixed types
contract TestContract {
    a1: Int = 1;
    a2: Bool = false;
    a3: String = "x";
    a4: Int? = null;
    a5: String? = null;
    a6: Int = 6;
    a7: Bool? = null;
    a8: String = "y";
    a9: Int = 9;
    a10: Bool = true;
    a11: Int? = null;
    a12: String? = null;
    a13: Int = 13;
    a14: Bool = false;
    a15: String = "z";
    a16: Int? = 16;
    a17: String? = "abc";
    a18: Bool? = true;
    a19: Bool = false;
    a20: String = "q";
    a21: Int = 21;

    init() {
        self.a4 = 4;
        self.a5 = "five";
        self.a7 = true;
        self.a11 = 11;
        self.a12 = "twelve";
    }
}