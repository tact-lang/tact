struct Token {
    symbol: String;
    decimals: Int;
}

contract NonNullOptStruct {
    s: Token?;

    init() {
        self.s = Token{
            symbol: "ABC",
            decimals: 9,
        };
    }
}