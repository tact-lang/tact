// Test very long string default in struct
struct LongStringDefault {
    txt: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
}

contract LongStringHolder {
    s: LongStringDefault;

    init() {
        self.s = LongStringDefault{};
    }
}
