contract OptionSerializeNested {
    inner: Inner?;
    init(){
        self.inner = null;
    }
}

struct Inner {
    a: Int as uint4;
    b: Int as int64;
}