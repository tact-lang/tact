struct SOptionals {
    a: Int?;
    b: Bool?;
    c: Int;
}

contract InitializeNulls {
    data: SOptionals;
    init() {
        self.data = SOptionals{
            a: null,
            b: null,
            c: 5
        };
    }
}