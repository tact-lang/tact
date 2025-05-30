const addr: Address = address("-1:0000000000000000000000000000000000000000000000000000000000000000");

contract Test {
    receive() {
        let a = addr;
    }
}