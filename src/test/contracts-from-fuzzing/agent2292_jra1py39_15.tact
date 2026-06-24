contract OnlyFields {
    foo: Int = 1;
    bar: Bool = false;
    text: String = "";
    val: Int? = null;

    init() {
        self.foo = 10;
        self.bar = true;
        self.text = "updated";
        self.val = 25;
    }
}