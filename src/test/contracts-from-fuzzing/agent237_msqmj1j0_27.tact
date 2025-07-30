struct InnerOne {
    x: Int;
}

struct MiddleOne {
    inner: InnerOne;
}

struct OuterOne {
    middle: MiddleOne;
}

contract ThreeLevel {
    data: OuterOne;
    init() {
        self.data = OuterOne{middle: MiddleOne{inner: InnerOne{x: 7}}};
    }
}