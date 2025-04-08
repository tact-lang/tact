struct S {
    a: Int?;
    b: Bool?;
}

contract NullRoot {
    data: S? = null;

    init() {
        self.data = S{
            a: null,
            b: null,
        };
    }
}