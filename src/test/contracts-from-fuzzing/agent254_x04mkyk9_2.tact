fun test(x: Int): Int {
    if (x == 0) {
        return 100; // early return
    } else {
        return 200;
    }
}

contract Test {
    // Const initializer using compile-time function
    const a: Int = test(0);
    
    // Another const initializer using the other branch
    const b: Int = test(1);

    receive() {}
}