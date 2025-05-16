const FLAG: Bool = true;

contract Test {
    receive() {
        dump(FLAG);
    }
}
