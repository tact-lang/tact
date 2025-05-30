message UniverseCalls {
    unused: Int;
}

contract ValidReceive {
    receive(_: UniverseCalls) {
        // Correct: Discards the parameter
    }
}
