contract PrimitiveDefaults {
    num: Int = 999;
    flag: Bool = false;
    txt: String = "foobar";

    receive() {
        self.num = 1000;
        self.flag = true;
        self.txt = "baz";
    }
}