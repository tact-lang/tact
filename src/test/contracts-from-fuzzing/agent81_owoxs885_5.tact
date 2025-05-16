// Snippet A3: Valid global function with multiple discard parameters

fun add(_: Int, _: Int): Int { return 42; }

contract TestAdd {
    receive() {
        dump(add(7, 35));
    }
}
