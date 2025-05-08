struct LayerOne {
    partOne: Int;
    rem: Slice as remaining;
}

struct LayerTwo {
    layerOne: LayerOne;
    extra: Slice as remaining;
}

contract MultipleRemaining {
    storage: LayerTwo;

    init() {
        self.storage = LayerTwo{
            layerOne: LayerOne{
                partOne: 1,
                rem: emptyCell().asSlice(),
            },
            extra: emptyCell().asSlice(),
        };
    }
}