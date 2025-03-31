fun discarder(_ : Int): Int { return 42; }

contract Test {
    receive() {
         discarder(1);
    }
}
