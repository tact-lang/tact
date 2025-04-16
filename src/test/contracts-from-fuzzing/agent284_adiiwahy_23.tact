struct S {
    a: Int;
    b: Int;
}

contract FieldOrder {
    data: S;

    init() {
        self.data = S{
            b: 20,
            a: 10
        };
    }
}