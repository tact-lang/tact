struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}