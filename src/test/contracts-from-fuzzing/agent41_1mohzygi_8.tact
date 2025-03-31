message UniverseCalls {}

contract TestUnderscore {
    // Test underscore usage in receiver parameter
    receive(_: UniverseCalls) {
        // Dummy operation using no parameter
        let x = 10;
    }

    // Dummy getter forcing function compilation
    get fun dummy(): Int {
        return 10;
    }
}
