struct OptionTest { a: Int? = 42; }

contract TestOptionDefault {
    receive() {
        let o: OptionTest = OptionTest{};
        o.a;
    }
}
