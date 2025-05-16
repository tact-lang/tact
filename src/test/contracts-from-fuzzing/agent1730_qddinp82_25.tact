struct DeepOptions {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

struct MidOptions {
    deep: DeepOptions?;
}

struct OuterMostOptions {
    mid: MidOptions?;
}

contract OptionLayerCake {
    top: OuterMostOptions;

    init() {
        self.top = OuterMostOptions{
            mid: MidOptions{
                deep: DeepOptions{
                    a: 1, b: null, c: 3, d: null
                }
            }
        };
    }
}