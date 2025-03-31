contract TestVar {
    init() {
        let _ : Int = 5; // Invalid: wildcard used as variable name
    }
    receive() {}
}
