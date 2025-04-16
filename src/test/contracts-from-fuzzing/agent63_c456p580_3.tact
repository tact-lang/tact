contract TestTernary {
    receive() {
        // Basic ternary operator test
        let a = (1 > 2) ? 10 : 20;
        dump(a);
    }
}

fun add(x: Int, y: Int): Int {
    return x + y;
}

contract TestFunction {
    receive() {
        // Call a simple function
        dump(add(5, 6));
    }
}
