struct Inner {
    val: Int;
    opt: String?; 
}

struct Outer {
    inner: Inner;
    comment: String = "Outer";
    number: Int?;
}

contract NestedStructTest {
    data: Outer; 

    init() {
        self.data = Outer{
            inner: Inner{
                val: 42,
                opt: null,
            },
            comment: "Outer",
            number: null,
        };
    }

    receive() {
        // Access deeply nested optional
        if (self.data.inner.opt != null) {
            dump(self.data.inner.opt!!);
        }
    }
}