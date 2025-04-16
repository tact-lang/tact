struct BoolIntNested {
    bi: InnerBoolInt;
}

struct InnerBoolInt {
    b: Bool;
    i: Int;
}

contract TestContract {
    d: BoolIntNested;

    init() {
        self.d = BoolIntNested{
            bi: InnerBoolInt{
                b: true,
                i: 3
            }
        };
    }
}