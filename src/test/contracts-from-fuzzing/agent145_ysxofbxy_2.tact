struct DeepInner {
    a: Int;
    b: Bool;
}

struct Inner2 {
    sub: DeepInner;
    val: Int;
}

struct Inner1 {
    flag: Bool;
    inner: Inner2;
}

contract DeepNested {
    data: Inner1;
    
    init() {
        self.data = Inner1{
            flag: false,
            inner: Inner2{
                sub: DeepInner{ a: 999, b: true },
                val: 123
            }
        };
    }
}
