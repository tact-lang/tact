struct Deep {
    field: Int;
}

contract DeepOptional {
    a: Deep?;

    init() {
        self.a = null;
    }
}