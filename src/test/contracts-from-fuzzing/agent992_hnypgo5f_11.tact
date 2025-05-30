struct S1 {
    x: Int = 7;
    y: String = "test";
}

contract TestContract {
    a: S1;
    init() {
        self.a = S1{};
    }
}
