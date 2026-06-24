struct Nested {
    a: Int = 5;
    b: String? = null;
}

contract BugRepro {
    val: Nested? = null;

    init() {
        self.val = Nested{ a: 10, b: "hi" };
    }
    receive() {}
}