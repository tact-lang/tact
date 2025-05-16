struct A {
    foo: Int;
    bar: Bool;
}

contract MultiVars {
    val1: Int;
    val2: Bool;
    val3: String;
    st: A;

    init() {
        self.val1 = 10;
        self.val2 = true;
        self.val3 = "hi";
        self.st = A{foo:1, bar:false};
    }
}