contract Test {
    receive() {
        // Testing string equality comparison in control flow
        if ("abc" == "abc") {
            let s: String = "equal";
        } else {
            let s: String = "different";
        }
    }
}
