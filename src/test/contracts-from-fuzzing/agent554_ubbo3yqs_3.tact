struct Inner {
    opt: Int?;
    flag: Bool;
}

contract OptionalStructField {
    data: Inner;

    init() {
        self.data = Inner{
            opt: null,
            flag: true
        };
    }
}