struct MultiLayer {
    first: LayerOne;
}

struct LayerOne {
    second: LayerTwo;
    v: Int;
}

struct LayerTwo {
    str: String;
    b: Bool;
}

contract TestContract {
    data: MultiLayer;

    init() {
        self.data = MultiLayer{
            first: LayerOne{
                v: 5,
                second: LayerTwo{
                    str: "x",
                    b: true,
                }
            }
        };
    }
}