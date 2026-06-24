message UniverseCalls { value: Int }

contract Test {
    receive(_: UniverseCalls) {
        // valid usage: discard the parameter
    }
}
