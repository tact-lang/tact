contract DefaultsTest {
    count: Int = 10;
    flag: Bool = true;
    name: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = null;

    init() {
        self.count = 20;
        self.flag = false;
        self.name = "def";
        self.optInt = 30;
        self.optBool = true;
    }
}