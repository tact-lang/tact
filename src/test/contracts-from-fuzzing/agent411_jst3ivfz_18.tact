struct Pair {
    x: Int;
    y: Bool;
}

struct Wrap {
    inner: Pair;
    flag: Bool;
}

contract WrappedStruct {
    p: Wrap;

    init() {
        self.p = Wrap{
            inner: Pair{ x:5, y:false },
            flag: true
        };
    }
}