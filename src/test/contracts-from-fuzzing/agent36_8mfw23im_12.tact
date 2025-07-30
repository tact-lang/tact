const FIRST: Int = 10;
const SECOND: Int = FIRST * 2; // should be 20

contract TestChain {
    a: Int = SECOND - 5; // expecting 15

    receive() {}
}
