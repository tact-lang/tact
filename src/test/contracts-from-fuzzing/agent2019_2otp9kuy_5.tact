struct Inner2 {
    f1: Int;
    f2: String;
}

struct Inner1 {
    nested: Inner2;
    desc: String;
}

contract TwoNestedFields {
    part1: Inner1;
    part2: Inner2;

    init() {
        self.part1 = Inner1{ nested: Inner2{ f1: 1, f2: "a" }, desc: "x" };
        self.part2 = Inner2{ f1: 2, f2: "b" };
    }
}