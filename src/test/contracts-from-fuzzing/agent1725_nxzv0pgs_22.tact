struct OptionalPacked {
    a: Int? as uint4;
    b: Int? as uint4;
}

contract TestContract {
    optPacked: OptionalPacked;

    init() {
        self.optPacked = OptionalPacked{
            a: null,
            b: 5
        };
    }
}