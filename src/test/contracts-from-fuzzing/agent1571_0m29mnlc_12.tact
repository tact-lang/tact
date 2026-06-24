message(11) MsgA { foo: Int }

struct Inner {
    m: MsgA?;
    val: Int;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Outer? = null;

    init() {
        self.data = Outer{
            inner: Inner{
                m: MsgA{ foo: 42 },
                val: 77
            },
            flag: true
        };
    }
}