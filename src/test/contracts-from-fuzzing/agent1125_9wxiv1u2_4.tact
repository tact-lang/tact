struct Inner { inner: Int }
struct OptionalNest {
    opt_inner: Int?;
    opt_struct: Inner?;
}

contract Test {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{
            opt_inner: null,
            opt_struct: null
        };
    }
}