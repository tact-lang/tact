struct Inner {
    foo: Bool?;
    bar: Int = 7;
}

contract OptDefault {
    field: Inner;

    init() {
        self.field = Inner{
            foo:true
        };
    }
}