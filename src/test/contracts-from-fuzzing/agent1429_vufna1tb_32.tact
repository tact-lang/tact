struct MultipleDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract StructMultiDefaults {
    val: MultipleDefaults;

    init() {
        self.val = MultipleDefaults { a:5, b:6, c:7 };
    }
}
