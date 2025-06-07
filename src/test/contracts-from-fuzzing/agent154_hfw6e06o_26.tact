struct LastOptional {
    a: Int;
    b: Bool;
    c: String?;
}

contract LastOptionalContract {
    data: LastOptional;

    init() {
        self.data = LastOptional{
            a: 5,
            b: true,
            c: null
        };
    }
}