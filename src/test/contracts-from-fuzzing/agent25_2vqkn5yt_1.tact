contract ReturnTest1 {
    // Function with early return inside conditional
    get fun foo(): Int {
        if (1 > 0) {
            return 1;
        }
        return 2;
    }

    receive () {}
}
