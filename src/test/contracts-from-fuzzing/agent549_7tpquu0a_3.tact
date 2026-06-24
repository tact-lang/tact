struct Params {
    name: String = "Satoshi";
    age: Int?;
    flag: Bool?;
    coins: Int;
}

contract OptTest {
    p: Params;

    init() {
        self.p = Params{
            coins: 1234,
        };
    }
}