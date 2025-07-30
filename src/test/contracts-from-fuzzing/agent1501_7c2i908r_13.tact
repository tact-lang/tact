struct RecB {
    foo: Int;
    sub: RecC;
}

struct RecC {
    bar: Int;
    sub: RecD;
}

struct RecD {
    baz: Int;
    sub: RecE;
}

struct RecE {
    value: Int;
}

contract TestContract {
    nest: RecB;

    init() {
        self.nest = RecB{
            foo: 1,
            sub: RecC{
                bar: 2,
                sub: RecD{
                    baz: 3,
                    sub: RecE{
                        value: 4,
                    },
                },
            },
        };
    }
}