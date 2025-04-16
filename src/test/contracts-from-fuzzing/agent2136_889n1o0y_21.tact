struct HasString {
    s: String = "";
}

contract TestContract {
    h: HasString = HasString{};

    init() {}
}