message CoolMsg {
    foo: Int = 99;
    bar: Bool = true;
}

contract TestContract {
    m: CoolMsg = CoolMsg{};

    init() {}

    receive() {
        dump(self.m.foo);
        dump(self.m.bar);
    }
}