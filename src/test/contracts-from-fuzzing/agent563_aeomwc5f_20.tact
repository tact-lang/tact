struct SText { greeting: String = "Hello Tact Language"; }

contract LargeStringConsts {
    s: SText;

    init() {
        self.s = SText{};
    }
}