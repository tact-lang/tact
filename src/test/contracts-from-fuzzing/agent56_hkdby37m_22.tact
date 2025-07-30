struct SOption {
    inner: Inner?;
}

struct Inner {
    val: Int;
    next: Next?;
}

struct Next {
    flag: Bool;
    text: String?;
}

contract ChainOptVals {
    field: SOption;

    init() {
        self.field = SOption{
            inner: Inner{
                val:1,
                next:null
            }
        };
    }
}