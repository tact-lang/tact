struct Inner {
    f: Int?;
}
contract AssignSomeOptional {
    x: Inner;

    init() {
        self.x = Inner{ f: null };
        self.x = Inner{ f: 42 };
    }
}