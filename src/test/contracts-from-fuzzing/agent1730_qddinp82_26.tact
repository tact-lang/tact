struct OneOpt {
    x: Int?;
}

struct HasTwo {
    a: OneOpt;
    b: OneOpt;
}

contract DoubleSubOptionals {
    val: HasTwo;

    init() {
        self.val = HasTwo{
            a: OneOpt{ x: null },
            b: OneOpt{ x: 5 }
        };
    }
}