fun add(a: Int, b: Int,) : Int {
    return a + b;
}

contract Test {
    receive() {
        let res = add(3, 4,);
    }
}
