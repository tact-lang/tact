struct Incomplete {
    foo: Int;
    bar: Bool;
}

contract PartialAssign {
    x: Incomplete;

    init() {
        self.x = Incomplete{foo: 1, bar: false};
    }
}