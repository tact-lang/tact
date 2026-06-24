struct Inner2 {
    a: Int;
}

struct Outer2 {
    nested: Inner2? = null;
    txt: String = "hi";
}

contract DefaultedNestedOptional {
    data: Outer2;

    init() {
        self.data = Outer2{
            nested: null,
            txt: "hello"
        };
    }

    receive() {
        if (self.data.nested != null) {
            let _ = self.data.nested!!.a;
        }
    }
}