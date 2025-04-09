struct S {
    a: Int = 1;
    b: Bool?;
    c: String = "hello";
}

contract TestContract {
    field: S;

    init() {
        self.field = S{
            b: null
        };
    }
}