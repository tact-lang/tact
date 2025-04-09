struct ChainedOptionals { a: Int?; b: Bool?; c: Int?; d: Bool?; e: Int?; }

contract ChainedOptionalsContract {
    data: ChainedOptionals;

    init() {
        self.data = ChainedOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }

    receive() {}
}