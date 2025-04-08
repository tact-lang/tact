const DEF_VAL: Int = 77;
const DEF_FLAG: Bool = true;

struct Inner {
    flag: Bool;
    val: Int;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    nestedField: Outer = Outer{ inner: Inner{ flag: DEF_FLAG, val: DEF_VAL } };
    init() {}
}