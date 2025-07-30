struct A {
    i: Int?;
    s: String?;
}

contract OptionalInit {
    val: A;

    init() {
        self.val = A{ i: 7, s: null };
    }
}