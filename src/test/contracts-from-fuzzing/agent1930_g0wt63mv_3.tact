struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: true,
            c: Inner{ value: 99 }
        };
    }
}