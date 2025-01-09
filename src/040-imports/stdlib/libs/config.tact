fun getConfigAddress(): Address {
    let cell: Cell = getConfigParam(0)!!;
    let sc: Slice = cell.beginParse();
    return newAddress(-1, sc.loadUint(256));
}

fun getElectorAddress(): Address {
    let cell: Cell = getConfigParam(1)!!;
    let sc: Slice = cell.beginParse();
    return newAddress(-1, sc.loadUint(256));
}