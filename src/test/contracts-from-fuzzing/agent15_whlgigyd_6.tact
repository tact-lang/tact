const GLOBAL: Int = 1000 + ton("42") + pow(10, 9);

contract TestArithmetic {
    get fun calc(): Int {
        return GLOBAL;
    }
}
