// Empty string default values
struct Def {
    s: String = "";
    n: Int = 0;
}

contract TestDefaults {
    data: Def;

    init() {
        self.data = Def{};
    }

    receive() {
        self.data = Def{ s: "abc", n: 42 };
    }
}