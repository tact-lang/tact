contract TestContract {
    foo: Int = 5;
    flag: Bool = false;
    opt: Int? = null;
    text: String = "test";

    init() {
        self.foo = 10;
        self.flag = true;
        self.opt = 20;
        self.text = "done";
    }
}