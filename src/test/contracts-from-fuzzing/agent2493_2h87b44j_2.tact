struct Nested {
    a: Int;
    b: Int;
}

struct Wrapper {
    inside: Nested;
    flag: Bool;
}

contract TestContract {
    nestedStruct: Wrapper;

    init() {
        self.nestedStruct = Wrapper{
            inside: Nested{ a: 10, b: 20 },
            flag: true
        };
    }
}