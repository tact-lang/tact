struct FirstLayer {
    x: Int;
    y: String;
}

struct SecondLayer {
    nested1: FirstLayer;
    nested2: FirstLayer;
}

contract MultiNestedContract {
    data: SecondLayer;

    init() {
        self.data = SecondLayer{
            nested1: FirstLayer{
                x: 1,
                y: "one"
            },
            nested2: FirstLayer{
                x: 2,
                y: "two"
            }
        };
    }
}
