struct IntLayer {
    small: Int as uint8;
    medium: Int as int64;
    big: Int;
}

contract IntLayerContract {
    data: IntLayer;

    init() {
        self.data = IntLayer{
            small: 200,
            medium: -500,
            big: 1000000
        };
    }
}