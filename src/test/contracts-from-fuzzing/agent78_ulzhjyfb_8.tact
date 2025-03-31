fun add(_: Int, _: Int): Int { return 123; }

contract Test {
    receive() {
       let result = add(10, 20);
       dump(result);
    }
}
