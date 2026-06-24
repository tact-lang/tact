struct Inner {
    n: Int?;
}

contract OptionalIntStruct {
    field: Inner;

    init() {
        self.field = Inner{n:null};
    }
}