struct Inline {
    a: Int;
    b: Bool;
}

contract TestContract {
    val: Inline;

    init() {
        self.val = Inline{ a:1, b:false };
    }
}