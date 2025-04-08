struct MyS {
    foo: Int = 42;
    bar: Int?;
}

contract TestContract {
    s: MyS = MyS{};

    init() {
        self.s = MyS{};
    }

    receive() { let _ = self.s; }
}