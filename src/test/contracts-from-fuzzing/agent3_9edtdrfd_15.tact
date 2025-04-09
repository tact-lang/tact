struct WithRemaining {
    a: Int as uint4;
    rem: Cell as remaining;
}

fun testRemaining(): Bool {
    // Build a cell with 4 bits for 'a' and 8 bits of additional data
    let builder = beginCell()
        .storeUint(3, 4)  // store 3 using 4 bits
        .storeUint(7, 8); // store 7 using 8 bits in the remaining
    let cell = builder.endCell();

    let res = WithRemaining.fromCell(cell);
    // To check the number of bits in the remaining cell, convert it to a Slice
    return res.a == 3 && res.rem.asSlice().bits() >= 8;
}

contract TestRemaining {
    receive() {
        let ok = testRemaining();
        if (!ok) { throw(1); }
        cashback(sender());
    }
}
