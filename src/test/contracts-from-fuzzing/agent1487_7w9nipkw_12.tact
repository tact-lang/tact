struct WrapString {
    s: String;
}

contract WrapperContract {
    w: WrapString;

    init() {
        self.w = WrapString{ s: "Example" };
    }
}