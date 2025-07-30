struct DeepNest {
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
    opt: Outer?;
}

struct Outer {
    num: Int;
}

contract DeepNestTest {
    s: DeepNest = DeepNest{
        inner: Inner{
            val: 10,
            flag: true,
            opt: Outer{ num: 99 }
        }
    };

    init() {
        self.s = DeepNest{
            inner: Inner{
                val: 20,
                flag: false,
                opt: null
            }
        };
    }
}