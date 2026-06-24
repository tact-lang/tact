contract EmptyOptAndVals {
    foo: Int = 5;
    bar: Int? = null;
    flag: Bool = false;
    str: String = "abc";

    init() {
        self.foo = 10;
        self.bar = null;
        self.flag = true;
        self.str = "def";
    }
}