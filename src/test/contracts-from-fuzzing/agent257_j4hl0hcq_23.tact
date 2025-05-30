struct Test {
    a: Int = 1;
    b: Bool;
    c: String?;
}

contract TestInit {
    t: Test;
    init() {
        self.t = Test{a: 5, b: true, c: null};
    }
}