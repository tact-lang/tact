// assign large positive number to int as uint4 (max 15)
contract LargeToSmall {
    a: Int as uint4;

    init() {
        self.a = 200;
    }
}
