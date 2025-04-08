struct A {
    large: Int as int257;
    med: Int as int128;
    small: Int as int64;
    tiny: Int as int8;
}

contract Test {
    data: A;
    init() {
        self.data = A{
            large: 123,
            med: 456,
            small: 789,
            tiny: 7
        };
    }
}