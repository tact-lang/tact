struct Nested {
    val1: Int;
    val2: Bool?;
}

struct Complex {
    nestedField: Nested;
    optionalNested: Nested?;
    flag: Bool;
    amount: Int as uint32;
}

contract TestContract {
    data: Complex;
    
    init() {
        self.data = Complex{
            nestedField: Nested{ val1: 5, val2: true },
            optionalNested: null,
            flag: false,
            amount: 10000,
        };
    }
}