struct DefaultsAndNulls {
    num: Int = 1;
    flag: Bool? = null;
    name: String = "test";
}

contract TestContract {
    p: DefaultsAndNulls;

    init() {
        self.p = DefaultsAndNulls{};
    }
}