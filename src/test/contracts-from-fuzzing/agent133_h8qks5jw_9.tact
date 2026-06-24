message (42) UniverseCalls {}

contract Test6 {
    x: Int = 0;

    // Test 6: Using underscore to discard receiver parameter
    receive(_: UniverseCalls) {
        self.x = 999;
    }
}
