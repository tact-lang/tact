const X: Int = 42;

contract ConstTest {
    // receive function that uses the constant
    receive() {
         let y: Int = X;
         dump(y);
    }
}
