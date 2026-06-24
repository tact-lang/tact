const BASE: Int = 10;
const DOUBLE: Int = BASE * 2;

contract TestConst {
    get fun getDouble(): Int {
         return DOUBLE; // Expected 20
    }
}
