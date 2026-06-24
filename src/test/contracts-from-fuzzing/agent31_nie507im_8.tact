contract TestValidAddress {
    // A valid address string in compile-time should compile and embed the Address constant.
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    
    receive() {}
}
