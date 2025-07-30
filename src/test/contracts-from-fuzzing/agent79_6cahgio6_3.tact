/* OptionalsValid.tact: Valid usage of optionals */
contract OptionalsValid() {
    fun test() {
        let a: Int? = null;
        a = 42;
        if (a != null) {
            dump(a!!); // should dump 42
        } else {
            dump(0);
        }
    }

    fun main() {
        self.test();
    }
}

contract Dummy() {}