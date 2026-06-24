fun testMap(): map<Int, Cell> {
    let m: map<Int, Cell> = emptyMap();
    m.set(1, beginCell().storeUint(1, 32).endCell());
    return m;
}

contract TestContract {
    receive() {
        testMap();
    }
}