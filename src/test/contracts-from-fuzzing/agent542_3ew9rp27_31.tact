struct EmptyString {
    s: String = "";
}

contract TestContract {
    e: EmptyString;

    init() {
        self.e = EmptyString{};
    }
}