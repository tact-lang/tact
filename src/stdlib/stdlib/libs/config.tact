/// Retrieves config parameter `0` as an `Address`.
///
/// See: https://docs.tact-lang.org/ref/stdlib-config#getconfigaddress
///
fun getConfigAddress(): Address {
    let cell: Cell = getConfigParam(0)!!;
    let sc: Slice = cell.beginParse();
    return newAddress(-1, sc.loadUint(256));
}

/// Retrieves config parameter `1` as an `Address`.
///
/// See: https://docs.tact-lang.org/ref/stdlib-config#getelectoraddress
///
fun getElectorAddress(): Address {
    let cell: Cell = getConfigParam(1)!!;
    let sc: Slice = cell.beginParse();
    return newAddress(-1, sc.loadUint(256));
}
