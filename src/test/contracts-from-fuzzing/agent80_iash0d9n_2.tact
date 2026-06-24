fun test(): Int {
    // Testing a valid String literal using capitalized 'String'
    let s: String = "Hello, Tact!";
    return 0;
}

contract TestContract {
    receive() {
        test();
    }
}
