struct OptionalNesting {
    nest: Inner?;
    flag: Bool;
}

struct Inner {
    number: Int;
    note: String;
}

contract OptNest {
    data: OptionalNesting;

    init() {
        self.data = OptionalNesting{
            nest: null,
            flag: true,
        };
    }
}