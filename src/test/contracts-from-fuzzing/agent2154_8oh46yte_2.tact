struct Nested {
    a: Int;
    b: Bool;
}

struct Container {
    nested: Nested;
    flag: Bool;
}

contract DeepContract {
    data: Container;

    init() {
        self.data = Container{
            nested: Nested{a: 42, b: true}, 
            flag: false
        };
    }
}