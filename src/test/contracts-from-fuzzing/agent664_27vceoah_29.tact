struct Defaulted {
    foo: Int = 42;
    bar: Bool?;
}

contract DefaultPart {
    data: Defaulted;

    init() {
        self.data = Defaulted{ bar: null };
    }
}
