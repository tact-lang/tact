struct Nested {
    s: String;
    flag: Bool?;
    amount: Int?;
}

struct Middle {
    nested: Nested;
    number: Int;
}

contract TestContract {
    middle: Middle;

    init() {
        self.middle = Middle{
            nested: Nested{
                s: "nested",
                flag: null,
                amount: null
            },
            number: 100
        };
    }

    receive() {}
}