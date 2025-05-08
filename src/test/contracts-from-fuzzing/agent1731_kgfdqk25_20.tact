struct X {
    a: Int;
    b: String?;
}

contract OptInit {
    val: X;

    init() {
        self.val = X{
            a: 228,
            b: null
        };
    }
}
