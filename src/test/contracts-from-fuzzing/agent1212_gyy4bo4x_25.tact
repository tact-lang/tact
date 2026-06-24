struct Substruct {
    x: Int;
    y: Bool;
}

struct Wrapper {
    s: Substruct;
}

contract NestedStructField {
    v: Wrapper;
    init() {
        self.v = Wrapper{ s: Substruct{ x:1, y:true } };
    }
}