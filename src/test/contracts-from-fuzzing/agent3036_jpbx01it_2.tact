struct NestedOne {
    x: Int;
    y: String;
}

struct NestedTwo {
    nest: NestedOne;
    z: Bool?;
}

struct Container {
    val1: NestedTwo;
    val2: String;
}

contract TestNestedFields {
    storage: Container;
    
    init() {
        self.storage = Container{
            val1: NestedTwo{
                nest: NestedOne{ x: 42, y: "abc" },
                z: null
            },
            val2: "hello"
        };
    }
}
