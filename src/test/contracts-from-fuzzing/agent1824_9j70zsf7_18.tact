// Testing nested structs with both optional and required fields
struct Inner {
    flag: Bool;
    maybeText: String?;
}

struct Outer {
    inner: Inner;
    maybeInner: Inner?;
}

contract MixedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{flag:true, maybeText:null},
            maybeInner: null
        };
    }
}
