/// Encodes an off-chain `link` from a `String` to a `Cell`.
fun createOffchainContent(link: String): Cell {
    let builder: StringBuilder = beginStringFromBuilder(beginCell().storeUint(0x01, 8));
    builder.append(link);
    return builder.toCell();
}
