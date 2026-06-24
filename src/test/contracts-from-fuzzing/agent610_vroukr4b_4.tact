struct Deep3 {
    val: Int;
    opt: Bool?;
}

struct Deep2 {
    d3: Deep3;
    flag: Bool;
}

struct Deep1 {
    d2: Deep2;
    number: Int;
}

contract TestContract {
    d1: Deep1;

    init() {
        self.d1 = Deep1{
            d2: Deep2{
                d3: Deep3{ val: 7, opt: null },
                flag: true
            },
            number: 42
        };
    }
}
