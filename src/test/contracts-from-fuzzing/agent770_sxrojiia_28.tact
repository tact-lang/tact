struct Inner {
    optInt: Int?;
}

contract TestContract {
    field: Inner;

    init() {
        self.field = Inner{
            optInt: null
        };
    }
}