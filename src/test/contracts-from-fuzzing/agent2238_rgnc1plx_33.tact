// Struct with nested optional nested opt 
struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    n: NestedOptional;
    init() {
        self.n = NestedOptional{
            inner: Inner{value:null}
        };
    }
}
