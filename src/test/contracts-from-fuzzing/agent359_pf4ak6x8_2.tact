struct Nested {
    n1: Int;
    n2: Bool;
}

contract NestTest {
    val: Nested;

    init() {
        self.val = Nested{n1: 1, n2: true};
    }
}