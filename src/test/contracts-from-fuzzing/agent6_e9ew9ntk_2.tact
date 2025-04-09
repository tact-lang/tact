fun test() {
    // According to the Tact documentation, the ternary operator is right-associative.
    // That is, the expression below should be grouped as
    // false ? 1 : (true ? 2 : 3) and evaluate to 2.
    let a = false ? 1 : true ? 2 : 3;
    dump(a);
}

contract TestContract {
    receive() {
        test();
    }
}
