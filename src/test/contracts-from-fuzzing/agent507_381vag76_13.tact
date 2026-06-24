struct S {
    one: Int;
    two: Int?;
    three: Int = 3;
    four: Int?;
    five: String = "five";
}

contract TestContract {
    aa: S;

    init() {
        self.aa = S{
            one: 1,
            two: null,
            four: null
        };
    }
}