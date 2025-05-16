struct BoolNest {
    x: Bool;
    y: Bool?;
}

struct OptionInner {
    z: BoolNest;
}

contract ManyNulls {
    data: OptionInner;

    init() {
        self.data = OptionInner{
            z: BoolNest{
                x: true,
                y: null
            }
        };
    }
}