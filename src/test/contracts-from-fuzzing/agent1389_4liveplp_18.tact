struct Bounds {
    small: Int as int8;
    big: Int as uint256;
}

contract BoundsContract {
    data: Bounds;

    init() {
        self.data = Bounds{ small: 127, big: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF };
    }
}