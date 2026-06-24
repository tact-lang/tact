contract TestContract {
    i: Int = 1;
    b: Bool = true;
    s: String = "abc";
    oInt: Int? = null;
    oBool: Bool? = null;
    oString: String? = null;

    init() {
        self.i = 5;
        self.b = false;
        self.s = "def";
        self.oInt = 10;
        self.oBool = true;
        self.oString = "hello";
    }
}