struct Inner1 {
    val: Int;
}

struct Inner2 {
    inner: Inner1;
}

contract OptionalNested {
    field: Inner2?;

    init() {
        self.field = Inner2{
            inner: Inner1{val:7}
        };
    }
}