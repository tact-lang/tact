contract TestContract {
    receive() {
        // Testing string literal equality in control flow
        let s: String = "test";
        if (s == "test") {
            dump("equal");
        } else {
            dump("not equal");
        }
    }
}
