struct Info {
    value: Int;
}

contract TestContract {
    a: Int = 7;
    b: Bool;
    c: String?;
    d: Info;

    init() {
        self.b = true;
        self.c = null;
        self.d = Info{value:42};
    }
}