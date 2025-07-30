message UniverseCalls {}

contract TestUnderscore {
    receive(_: UniverseCalls) {
        // This receiver discards the parameter using underscore
    }
}
