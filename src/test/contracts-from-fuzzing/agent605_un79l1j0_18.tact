struct S {
    a: Int;
    b: Int = 0;
}

contract DefaultedStructField {
    val: S;

    init() {
        self.val = S{ a: 3 };
    }
}