struct OptionalNested {
    x: Int?;
    y: Bool?;
}

struct Holder {
    mainVal: Int;
    optN: OptionalNested?;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder{
            mainVal: 5,
            optN: OptionalNested{
                x: 1,
                y: null
            }
        };
    }
}