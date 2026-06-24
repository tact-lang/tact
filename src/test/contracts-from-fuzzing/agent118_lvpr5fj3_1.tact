struct Nested {
    flag: Bool;
    number: Int;
    nestedAgain: Inner;
}

struct Inner {
    innerFlag: Bool;
    innerNumber: Int;
}

contract TestStorage {
    data: Nested;

    init() {
        self.data = Nested{
            flag: true,
            number: 10,
            nestedAgain: Inner{
                innerFlag: false,
                innerNumber: 20,
            },
        };
    }
}