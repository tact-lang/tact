struct NullableWrap {
    inner: Wrap?;
}

struct Wrap {
    flag: Bool;
}

contract OptWrap {
    val: NullableWrap;

    init() {
        self.val = NullableWrap{
            inner: Wrap{ flag:true }
        };
    }
}