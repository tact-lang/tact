struct Inner {
    foo: Int;
    bar: String?;
}

contract StructField {
    data: Inner;
    
    init() {
        self.data = Inner{
            foo: 5,
            bar: null,
        };
    }

    receive() {}
}