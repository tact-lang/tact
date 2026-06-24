struct InnerMost {
    deepVal: Int?;
}

struct InnerLayer {
    val: InnerMost?;
    other: Bool;
}

struct Wrapper {
    count: Int;
    maybeLayer: InnerLayer?;
    flag: Bool?;
}

contract OptionDeepStorage {
    fancy: Wrapper = Wrapper{
        count: 7,
        maybeLayer: InnerLayer{
            val: InnerMost{ deepVal: null },
            other: true,
        },
        flag: null,
    };

    init() {
        self.fancy = self.fancy;
    }
}