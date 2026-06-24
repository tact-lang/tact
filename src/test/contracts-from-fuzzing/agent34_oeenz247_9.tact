const EXP: Int = pow(2, 8);

contract TestExp {
    get fun getExp(): Int {
        return EXP; // expected to be 256
    }
}
