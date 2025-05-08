const GLOBAL_ONE: Int = 1 + 2;

contract Test {
    get fun value(): Int {
        return GLOBAL_ONE + 3;
    }
}
