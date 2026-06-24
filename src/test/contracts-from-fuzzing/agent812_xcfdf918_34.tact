struct NullableInner {
    s: String?;
}

struct Outer {
    i: Int;
    n: NullableInner;
}

contract NullableInNest {
    val: Outer;

    init() {
        self.val = Outer{ i:77, n: NullableInner{s:null} };
    }
}