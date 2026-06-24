contract TestLeadingZero {
    receive() {
        let a: Int = 020; // According to Tact, this is a decimal literal, so 20
        dump(a);
    }
}
