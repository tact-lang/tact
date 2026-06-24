contract TestAddressRoundTrip {
    receive() {
        // Use compile-time function address to embed a constant address
        let a: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
        let s: Slice = a.asSlice();
        let a2: Address = s.asAddress(0); // safe conversion, chain 0
        dump(a == a2 ? 1 : 0);
    }
}
