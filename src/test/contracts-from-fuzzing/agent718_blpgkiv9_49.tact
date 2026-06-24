struct DefaultsAndOptionals {
    a: Int = 1;
    b: Bool? = null;
    c: String = "abc";
    d: Address? = null;
}

contract DefaultsAndOptionalsContract {
    data: DefaultsAndOptionals;
    init() {
        self.data = DefaultsAndOptionals{};
    }
}