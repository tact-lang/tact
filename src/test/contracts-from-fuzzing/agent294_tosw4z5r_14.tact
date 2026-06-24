struct Limits {
    small: Int as uint8;
}

contract LimitTest {
    data: Limits;

    init() {
        self.data = Limits{
            small: 300
        };
    }
}
