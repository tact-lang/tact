struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: String?;
}

contract AllOptionalsTest {
    state: S;

    init() {
        self.state = S{
            d: null,
            e: null,
        };
    }
}