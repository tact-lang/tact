struct B {
    s: String;
}

contract Defaults {
    a: Int = 3;
    b: B = B{ s: "hello" };

    init() {
        self.a = 7;
        self.b = B{ s: "world" };
    }
}