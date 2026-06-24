struct S {
    x: Int;
    y: String?;
}

contract AssignNullStructOpt {
    s: S;

    init() {
        self.s = S{
            x: 10,
            y: null
        };
    }
}