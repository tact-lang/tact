// nested optional struct with internal optional
struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract TestNestedOptStruct {
    foo: OuterOpt;
    init() {
        self.foo = OuterOpt { inner: null };
    }
}
