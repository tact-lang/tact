struct OptionalInt {
    val: Int?;
}

contract DefaultOptional {
    opt: OptionalInt = OptionalInt{val: null};

    init() {
        self.opt = OptionalInt{val: null};
    }
}