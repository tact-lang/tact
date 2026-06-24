struct Sub {
    x: Int;
}

struct Sup {
    s: Sub;
    optS: Sub?;
}

contract PartialOpts {
    val: Sup;

    init() {
        self.val = Sup{
            s: Sub{ x: 1 },
            optS: null
        };
    }

    receive() {}
}