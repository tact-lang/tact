struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOptionals {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: 10,
            e: true,
            f: "hi"
        };
    }
}