struct WrappedString {
    val: String;
}

contract TestContract {
    s: WrappedString?;

    init() {
        self.s = WrappedString{ val: "hi" };
    }
}