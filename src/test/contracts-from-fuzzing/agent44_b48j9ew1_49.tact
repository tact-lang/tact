struct SStr {
    n: Int?;
    s: String?;
}

contract OptString {
    val: SStr?;

    init() {
        self.val = null;
    }

    receive() {
        self.val = SStr{ n: 3, s: "hello" };
    }
}