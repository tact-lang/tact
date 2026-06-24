struct X { a: Int; b: Bool; c: Int?; d: Bool? }

contract OptionalsInitTest {
    data: X;

    init() {
        self.data = X{
            a: 10,
            b: false,
            c: null,
            d: null
        };
    }

    receive() {}
}