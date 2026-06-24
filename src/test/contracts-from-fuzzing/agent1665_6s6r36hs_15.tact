struct WeirdString {
    s: String = "abc\x00def";
}

contract TestContract {
    ws: WeirdString = WeirdString{};

    init() {}
}