message UniverseCalls {}

contract TestUnderscore {
    receive(_: UniverseCalls) {
        // Using underscore parameter, value is discarded
    }
}
