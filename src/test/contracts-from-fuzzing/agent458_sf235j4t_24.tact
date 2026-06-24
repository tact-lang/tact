struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct HasManyOptionals {
    inner: ManyOptionals;
    str: String = "x";
}

contract DeepOptionals {
    data: HasManyOptionals;

    init() {
        self.data = HasManyOptionals{
            inner: ManyOptionals{
                a: null,
                b: null,
                c: null,
                d: null
            },
            str: "xyz"
        };
    }
}