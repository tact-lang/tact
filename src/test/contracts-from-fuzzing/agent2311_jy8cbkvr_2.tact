struct Inner {
    x: Int;
    y: Bool;
    s: String;
}

contract Test2 {
    val: Inner;

    init() {
        self.val = Inner{ x: 10, y: true, s: "hi" };
    }
}