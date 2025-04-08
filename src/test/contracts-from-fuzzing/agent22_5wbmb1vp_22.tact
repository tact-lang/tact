struct DeepDefaulted {
    layer1: InnerDefaulted;
}

struct InnerDefaulted {
    foo: Int = 1;
    sub: SubDefaulted;
}

struct SubDefaulted {
    val: Int = 2;
}

contract TestContract {
    nestedDefaulted: DeepDefaulted;

    init() {
        self.nestedDefaulted = DeepDefaulted{
            layer1: InnerDefaulted{
                foo: 5,
                sub: SubDefaulted{val: 10}
            }
        };
    }
}