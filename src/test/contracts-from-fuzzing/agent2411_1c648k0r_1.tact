struct Nested {
    flag: Bool;
    amount: Int?;
}

struct Container {
    nested: Nested;
    number: Int;
    text: String?;
}

contract TestContract {
    data: Container;
    
    init() {
        self.data = Container{
            nested: Nested{flag: true, amount: null},
            number: 42,
            text: "hello",
        };
    }
}