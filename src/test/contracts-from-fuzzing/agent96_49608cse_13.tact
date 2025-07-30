contract TestContract {
    // Persistent state variable computed at compile-time using ascii
    a: Int = ascii("abc");

    receive() {
        let x: Int = self.a; // Access the persistent value
        // Using the ascii computed value in a simple way
        if (x == ascii("abc")) {
            // Do nothing
        }
    }
}
