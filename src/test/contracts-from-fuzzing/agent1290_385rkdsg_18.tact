struct Nest {
    flag: Bool;
    strField: String?;
}

struct Outer {
    first: Nest;
    second: Nest;
    third: Nest;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            first: Nest{ flag: true, strField: null },
            second: Nest{ flag: false, strField: null },
            third: Nest{ flag: true, strField: null }
        };
    }

    receive() {
        self.val = Outer{
            first: Nest{ flag: false, strField: "a" },
            second: Nest{ flag: true, strField: "b" },
            third: Nest{ flag: false, strField: "c" }
        };
    }
}