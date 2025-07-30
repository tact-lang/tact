struct Inner {
    val: Int;
    note: String?;
}

struct Outer {
    a: Bool;
    b: Inner;
}

contract InlineDefaults {
    sfield: Outer = Outer{
        a: true,
        b: Inner{
            val: 99,
            note: null
        }
    };
}