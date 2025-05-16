// struct with default values + serialization attrs + optionals + nested
struct Inner {
    flag: Bool?;
    val: Int as uint32;
}

struct Outer {
    inner: Inner;
    c: Int as int64 = 42;
    s: String = "default";
}

contract TestContract {
    d: Outer;
    init() {
        self.d = Outer{
            inner: Inner{flag:null,val:99}
        };
    }
}
