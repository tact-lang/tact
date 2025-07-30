struct OuterOptional {
    inner: Int?;
}

contract OuterFieldOptional {
    field: OuterOptional?;

    init() {
        self.field = null;
    }
}