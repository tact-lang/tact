const PI: Int = 3;
const DOUBLE_PI: Int = PI + PI;

contract TestDouble {
    receive() {
        let val: Int = DOUBLE_PI;
    }
}