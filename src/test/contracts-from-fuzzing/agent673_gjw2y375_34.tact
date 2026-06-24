message Empty {}

contract TestContract {
    receive(_: Empty) {
        // do nothing
    }
}