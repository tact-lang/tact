// Nested optional with default inner values
struct Sub {
    a: Int?;
    b: Bool?;
}

struct Container {
    s1: Sub;
    s2: Sub;
}

contract NestedDefaults {
    value: Container;

    init() {
        self.value = Container{
            s1: Sub{ a:null, b:null },
            s2: Sub{ a:null, b:null }
        };
    }
}