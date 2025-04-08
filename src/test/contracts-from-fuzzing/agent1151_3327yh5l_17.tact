struct S {
    a: Int?;
}

contract InitNullOptional {
    x: S;
    init() {
        self.x = S{
            a: null
        };
    }
}