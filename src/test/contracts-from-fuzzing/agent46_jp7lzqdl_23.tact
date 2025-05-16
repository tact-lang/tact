struct HasOptional {
    value: Int?;
}

contract OptStruct {
    data: HasOptional;

    init() {
        self.data = HasOptional{ value: null };
    }
}
