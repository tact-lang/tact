struct Inner1 {
    v: Int;
}
struct Inner2 {
    inner: Inner1?;
}
struct Inner3 {
    inner: Inner2?;
}

contract MultiOptionalNestContract {
    data: Inner3;

    init() {
        self.data = Inner3{
            inner: Inner2{
                inner: null,
            },
        };
    }
}
