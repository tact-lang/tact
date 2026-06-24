struct Ordered {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    c: String;
    b: Bool;
    a: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
    }
}