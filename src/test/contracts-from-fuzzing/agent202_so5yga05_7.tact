trait A {}
trait B {}

contract Test() with A, B, {
    receive() {}
}