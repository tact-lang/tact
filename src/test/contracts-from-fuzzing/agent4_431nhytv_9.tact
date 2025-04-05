const TOP: Int = 42;

contract Test {
    // Using a top-level constant in a persistent state field
    x: Int = TOP;

    receive() {
        // No operation
    }
}
