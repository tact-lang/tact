// test empty string default values
struct DefaultsStr {
    s1: String = "";
    s2: String = " ";
}

contract DefaultsStrContract {
    d: DefaultsStr;

    init() {
        self.d = DefaultsStr{};
    }
}