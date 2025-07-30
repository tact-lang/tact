struct DefaultValsNested {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultValStructContract {
    f: DefaultValsNested;

    init() {
        self.f = DefaultValsNested{};
    }
}