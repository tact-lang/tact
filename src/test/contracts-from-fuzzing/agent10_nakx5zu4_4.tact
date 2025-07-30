contract TestForceBasechain {
    fun test() {
        // Create a valid basechain address
        let good: Address = newAddress(0, 42);
        forceBasechain(good);

        // Try using a masterchain address, expecting an exit with code 138 for Not a basechain address
        try {
            let bad: Address = newAddress(-1, 42);
            forceBasechain(bad);
        } catch (exitCode) {
            require(exitCode == 138, "Unexpected exit code");
        }
    }
}
