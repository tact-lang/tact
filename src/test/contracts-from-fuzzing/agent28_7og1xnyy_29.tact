const GREETING: String = "Hello\nWorld";

contract TestGlobalConst {
    receive() {
        dump(GREETING);
    }
}
