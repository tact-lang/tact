/// Encodes an off-chain `link` from a `String` to a `Cell`.
///
/// See: https://docs.tact-lang.org/ref/stdlib-content#createoffchaincontent
///
fun createOffchainContent(link: String): Cell {
    let builder: StringBuilder = beginStringFromBuilder(beginCell().storeUint(0x01, 8));
    builder.append(link);
    return builder.toCell();
}
