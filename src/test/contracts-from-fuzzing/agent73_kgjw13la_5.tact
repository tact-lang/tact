const BASE: Int = 2;
const EXP: Int = 10;

contract TestPower {
    // This getter returns 2^10 computed at compile time
    get fun power(): Int {
        return pow(BASE, EXP);
    }

    receive() {}
}
