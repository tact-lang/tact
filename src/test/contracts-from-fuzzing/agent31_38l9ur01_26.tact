struct S {
    x: Int;
    y: String?;
}

contract TestContract {
    a: S?;

    init() {
        self.a = S{
            x: 55,
            y: null,
        };
    }
}