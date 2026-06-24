struct MultiLevel {
    one: Int;
    two: InnerOne;
}

struct InnerOne {
    a: Bool;
    b: Int?;
}

contract TestContract {
    data: MultiLevel = MultiLevel{
        one: 1,
        two: InnerOne{ a: true, b: null }
    };

    init() {
        self.data = MultiLevel{
            one: 2,
            two: InnerOne{ a: false, b: 99 }
        };
    }
}