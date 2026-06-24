struct Complex {
    name: String;
    age: Int?;
    active: Bool;
    bigNumber: Int as uint128;
    tinyNumber: Int as uint4;
    text: String;
    optText: String?;
}

contract AllKinds {
    data: Complex;

    init() {
        self.data = Complex{
            name: "Alice",
            age: 20,
            active: true,
            bigNumber: 100000000000000000,
            tinyNumber: 10,
            text: "Hello",
            optText: null
        };
    }
}