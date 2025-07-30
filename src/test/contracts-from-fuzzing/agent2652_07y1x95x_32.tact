struct DifferentWidths {
    small: Int as uint4;
    big: Int as int32;
}

contract SerializeMix {
    data: DifferentWidths;

    init() {
        self.data = DifferentWidths{ small: 7, big: -2048 };
    }
}