struct SInner {
    a: Int;
    b: String;
}

struct SWrap {
    inner: SInner;
}

contract StructWrap {
    val: SWrap = SWrap{
        inner: SInner{ a: 1, b: "abc" }
    };
    receive() {}
}