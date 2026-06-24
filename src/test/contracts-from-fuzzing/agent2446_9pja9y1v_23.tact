struct DoubleNested {
    x: Int;
    y: Bool;
}

struct OuterTwo {
    n1: DoubleNested;
    n2: DoubleNested;
}

struct Top {
    inner: OuterTwo;
    flag: Bool;
}

contract DoubleNestContract {
    val: Top;

    init() {
        self.val = Top{
            inner: OuterTwo{
                n1: DoubleNested{x:1,y:true},
                n2: DoubleNested{x:2,y:false}
            },
            flag: true
        };
    }
}