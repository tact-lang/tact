struct Params {
    limit: Int = 500;
    owner: Address?;
}

contract Test {
    conf1: Params;
    conf2: Params;

    init() {
        self.conf1 = Params{};
        self.conf2 = Params{
            limit: 1000,
            owner: myAddress(),
        };
    }
}