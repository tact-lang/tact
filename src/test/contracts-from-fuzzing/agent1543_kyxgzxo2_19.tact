struct S {
    a: Slice?;
    b: Bool?;
}

contract TestContract {
    s: S;
    init() {
        self.s = S{
            a: emptyCell().asSlice(),
            b: true
        };
    }
}