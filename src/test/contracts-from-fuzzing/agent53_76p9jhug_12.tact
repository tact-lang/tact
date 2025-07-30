struct Metrics {
    small: Int as uint8;
    large: Int as int257;
}

struct Wrap {
    m: Metrics;
}

contract SerializeVariety {
    data: Wrap;

    init() {
        self.data = Wrap{ m: Metrics{ small: 255, large: -123456789 } };
    }
}