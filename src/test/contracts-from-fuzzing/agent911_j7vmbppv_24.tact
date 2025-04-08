struct FooOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AssignedFooOpt {
    opt: FooOpt;

    init() {
        self.opt = FooOpt{
            a: null,
            b: null,
            c: null
        };
    }
}