struct NestedOptionals1 {
    n1: Int?;
    n2: Bool?;
    n3: NestedOptionals1Inner?;
}

struct NestedOptionals1Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: NestedOptionals1;
    
    init() {
        self.data = NestedOptionals1{
            n1: 10,
            n2: true,
            n3: NestedOptionals1Inner{
                x: 5,
                y: false,
            },
        };
    }
}