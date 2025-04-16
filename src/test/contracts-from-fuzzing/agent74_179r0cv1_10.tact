struct Small { val: Int; }

struct Bigger {
    optA: Small?;
    required: Int;
    optB: Small?;
}

contract TestContract {
    foo: Bigger;

    init() {
        self.foo = Bigger{
            optA: Small{ val: 10 },
            required: 999,
            optB: null
        };
    }
}