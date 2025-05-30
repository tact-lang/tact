fun castAddressTest(): Bool {
    // Test casting Address to Slice and back, expecting equality
    let a: Address = myAddress();
    let s: Slice = a.asSlice();
    let a2: Address = s.asAddress(0);
    return a == a2;
}

contract CastAddressTest {
    receive() {
        castAddressTest();
    }
}
