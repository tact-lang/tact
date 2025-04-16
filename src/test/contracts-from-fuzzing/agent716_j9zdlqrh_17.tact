struct A {
    f1: Int?;
    f2: String;
}

contract OptStructDefault {
    s: A?;

    init() {
        self.s = null;
    }
}