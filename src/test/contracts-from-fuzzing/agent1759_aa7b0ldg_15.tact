// contract params with structurally nested optional fields
struct TokenInfo {
    symbol: String;
    decimals: Int;
    description: String?;
}

contract Token(
    info: TokenInfo?,
    supply: Int,
    owner: Address,
) {
    receive() {}
}