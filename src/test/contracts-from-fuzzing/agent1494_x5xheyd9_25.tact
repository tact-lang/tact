struct MultiOptional {
    i: Int?;
    b: Bool?;
}

contract OptionalStructInit {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            i: null,
            b: null
        };
    }
}
