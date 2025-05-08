struct CompositeA {
    ix: Int;
    ox: OptionB;
}

struct OptionB {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: CompositeA;

    init() {
        self.data = CompositeA{
            ix: 10,
            ox: OptionB{
                a: null,
                b: true
            }
        };
    }
}