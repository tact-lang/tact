struct Small {
    foo: Int;
    bar: String;
}

contract StructDefaultAndAssign {
    s: Small;

    init() {
        self.s = Small{foo:123,bar:"hello"};
    }
}
