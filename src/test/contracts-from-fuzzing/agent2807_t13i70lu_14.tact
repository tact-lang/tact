struct S {
    msg: String = "Hello";
    count: Int;
}

contract DefaultString {
    val: S;
    init() {
        self.val = S{ count: 10 };
    }
}