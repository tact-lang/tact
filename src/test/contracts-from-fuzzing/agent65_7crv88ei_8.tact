message UniverseCall {}

contract Test8 {
    // Using underscore to discard the parameter
    receive(_: UniverseCall) {
        // No need to use the parameter
    }
}
