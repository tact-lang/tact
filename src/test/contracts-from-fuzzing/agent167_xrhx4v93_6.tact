message UniverseCalls {}

contract Test {
    // Using underscore to discard the UniverseCalls parameter
    receive(_: UniverseCalls) {
        // Operation; parameter is discarded
        let a = 1;
    }
}
