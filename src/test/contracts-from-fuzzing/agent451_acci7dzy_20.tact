struct DeepOptionals {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int?;
    d: Bool?;
}

contract DeepOptionalContract {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: null
        };
    }
}