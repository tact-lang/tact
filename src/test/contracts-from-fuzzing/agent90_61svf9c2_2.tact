fun test1() : String {
    return "Hello, Tact!\nTab\tEnd";
}

contract TestContract {
    receive() {
        test1();
    }
}
