contract DefaultInitializerTest {
    intval: Int = 0;
    boolval: Bool = false;
    strval: String = "";
    optint: Int? = null;
    optbool: Bool? = null;
    optstr: String? = null;

    init() {
        self.intval = 10;
        self.boolval = true;
        self.strval = "abc";
        self.optint = 1;
        self.optbool = false;
        self.optstr = "xyz";
    }
}