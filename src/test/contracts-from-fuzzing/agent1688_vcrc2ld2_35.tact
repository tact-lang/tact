struct SDef {
    val: Int;
    txt: String;
}

contract TestContract {
    foo: Int = 100;
    bar: SDef = SDef{val:1, txt:"a"};
    baz: Bool;

    init() {
        self.baz = true;
    }
}