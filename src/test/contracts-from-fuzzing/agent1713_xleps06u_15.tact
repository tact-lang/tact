struct InnerOptional {
    a: Int?;
}

struct Container {
    value: InnerOptional?;
}

contract OptionalStructField {
    data: Container;

    init() {
        self.data = Container{ value: null };
    }
}