contract TestContract {
    int1: Int = 1;
    int2: Int = -1;
    bool1: Bool = true;
    bool2: Bool = false;
    string1: String = "hello";
    string2: String = "";
    address1: Address? = null;
    flag3: Bool? = null;
    optInt: Int? = null;
    strOpt: String? = null;

    receive() {
        let _ = self.int1 + self.int2;
    }
}