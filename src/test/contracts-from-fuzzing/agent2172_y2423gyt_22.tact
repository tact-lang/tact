struct A {
    v: Int;
}

contract OptStructField {
    opt: A?;

    init() {
        self.opt = null;
    }
}