struct Fancy {
    value: Int as int128;
    flag: Bool;
    amount: Int as coins;
}

contract FancyContract {
    s: Fancy;

    init() {
        self.s = Fancy{
            value: -123456789012345,
            flag: true,
            amount: ton("1")
        };
    }
}
