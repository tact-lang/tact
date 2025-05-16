struct S {
    a: Int;
    b: Bool;
}

contract PersistentOfStruct {
    data: S;

    init() {
        self.data = S{
            a: 5,
            b: true,
        };
    }
}