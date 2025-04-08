struct WeirdString {
    s: String = "hello\nworld\u2764";
}

struct OuterWeird {
    inner: WeirdString;
}

contract Test17 {
    val: OuterWeird;

    init() {
        self.val = OuterWeird{
            inner: WeirdString{},
        };
    }

    receive() {}
}