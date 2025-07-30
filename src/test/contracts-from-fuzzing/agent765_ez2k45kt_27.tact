struct HasString {
    s: String;
    n: Int;
}

contract TestContract {
    val: HasString;

    init() {
        self.val = HasString{ s:"hello", n:42 };
    }
}