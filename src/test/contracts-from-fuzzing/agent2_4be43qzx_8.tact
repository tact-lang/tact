message(42) UniverseCalls {}

contract Test {
    flag: Int = 0;

    // Receiver using underscore to discard parameter value
    receive(_: UniverseCalls) {
        self.flag = 1;
    }
}
