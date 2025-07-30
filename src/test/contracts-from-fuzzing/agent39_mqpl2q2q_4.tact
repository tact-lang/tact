contract TestAsciiError() {
    // This test attempts to call ascii with a multi-character string, which should be disallowed
    get fun test(): Int {
        return ascii("AB");
    }
}
