contract TestContract {
    receive() {
        if ("foo" == "foo") {
            // Expected to pass: string equality is allowed
        }
    }
}
