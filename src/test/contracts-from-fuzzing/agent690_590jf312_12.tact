struct DoubleLayer {
    first: Int;
    second: Layer2;
}

struct Layer2 {
    third: Int;
    fourth: Layer3;
}

struct Layer3 {
    value: Bool;
}

contract NestedFields {
    storage: DoubleLayer;

    init() {
        self.storage = DoubleLayer{
            first: 10,
            second: Layer2{
                third:20,
                fourth: Layer3{
                    value:true
                }
            }
        };
    }
}