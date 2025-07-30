struct EmptyInits {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract NoInitContract {
    data: EmptyInits;

    init() {
        self.data = EmptyInits{
            a: 0,
            b: false,
            c: null,
            d: null
        };
    }
}
