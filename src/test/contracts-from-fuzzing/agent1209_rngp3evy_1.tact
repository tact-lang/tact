struct Nested {
    flag: Bool;
    value: Int?;
}

struct Wrapper {
    nested: Nested;
    num: Int;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            nested: Nested{flag: false, value: null},
            num: 42
        };
    }
}