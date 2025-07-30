struct SerializeVarious {
    small: Int as uint8;
    med: Int as uint32;
    large: Int;
    negative: Int as int32;
}

contract TestContract {
    data: SerializeVarious;

    init() {
        self.data = SerializeVarious{
            small: 1,
            med: 65535,
            large: 999999999999,
            negative: -12345
        };
    }
}
