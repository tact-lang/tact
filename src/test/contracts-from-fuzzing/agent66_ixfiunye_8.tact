fun stringEquality(): Bool {
    return "A" == "A";
}

contract TestContract {
    receive() {
        stringEquality();
    }
}
