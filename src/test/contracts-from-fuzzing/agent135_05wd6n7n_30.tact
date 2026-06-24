struct NestedStructA {
    a: Int;
    b: Bool?;
}

struct NestedStructB {
    inner: NestedStructA;
    c: String;
}

struct NestedStructC {
    nestB: NestedStructB;
    d: Int?;
}

contract DeepChain {
    data: NestedStructC;
    
    init() {
        self.data = NestedStructC{
            nestB: NestedStructB{
                inner: NestedStructA{
                    a: 5,
                    b: null
                },
                c: "abc"
            },
            d: null
        };
    }
}
