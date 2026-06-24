contract TestStringEquality {
    receive() {
        // Testing string equality in a control flow.
        let a: String = "Tact";
        if (a == "Tact") {
            dump(1);
        } else {
            dump(0);
        }
    }
}
