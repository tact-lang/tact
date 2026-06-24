struct S {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            optInt: null,
            optBool: null
        };
    }
}