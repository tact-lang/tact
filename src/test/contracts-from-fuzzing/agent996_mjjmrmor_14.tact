struct RepeatedOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract TestStorage {
    data: RepeatedOptional;

    init() {
        self.data = RepeatedOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}