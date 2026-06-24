fun test() {
    // Malformed operator sequence: using ++ operator which is not defined in Tact grammar
    let x = 1 ++ 2;
}

contract TestContract {
    receive() {
        test();
    }
}
