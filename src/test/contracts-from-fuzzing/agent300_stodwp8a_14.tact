struct Inner {
    amount: Int as uint16;
}

struct Complex {
    count: Int as uint8;
    inner: Inner;
    optFlag: Bool?;
    optName: String?;
    definite: Bool;
    label: String;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            count: 5,
            inner: Inner{amount: 12345},
            optFlag: null,
            optName: "hi",
            definite: true,
            label: "label",
        };
    }
}