struct Complex {
    flag: Bool;
    count: Int as uint16;
    big: Int;
    name: String?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            flag: true,
            count: 42,
            big: 123456,
            name: null
        };
    }
}