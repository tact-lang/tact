const GREETING: String = "Hello, Tact!";

contract Test {
    receive() {
        dump(GREETING);
    }
}
