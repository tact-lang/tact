fun multi(_ : Int, _ : Int): Int { return 0; }

contract Test {
    receive() { 
         multi(3, 4);
    }
}
