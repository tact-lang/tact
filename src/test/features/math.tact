import "@stdlib/deploy";

contract MathTester with Deployable {
    init() {

    }

    get fun add(a: Int, b: Int): Int {
        return a + b;
    }

    get fun sub(a: Int, b: Int): Int {
        return a - b;
    }

    get fun mul(a: Int, b: Int): Int {
        return a * b;
    }

    get fun div(a: Int, b: Int): Int {
        return a / b;
    }

    get fun mod(a: Int, b: Int): Int {
        return a % b;
    }

    get fun shr(a: Int, b: Int): Int {
        return a >> b;
    }

    get fun shl(a: Int, b: Int): Int {
        return a << b;
    }

    get fun and(a: Int, b: Int): Int {
        return a & b;
    }

    get fun or(a: Int, b: Int): Int {
        return a | b;
    }

    get fun xor(a: Int, b: Int): Int {
        return a ^ b;
    }
    
    get fun bitwise_not(a: Int): Int {
        return ~a;
    }

    //
    // Augmented assignment
    //

    get fun addAug(a: Int, b: Int): Int {
        a += b;
        return a;
    }

    get fun subAug(a: Int, b: Int): Int {
        a -= b;
        return a;
    }

    get fun mulAug(a: Int, b: Int): Int {
        a *= b;
        return a;
    }

    get fun divAug(a: Int, b: Int): Int {
        a /= b;
        return a;
    }

    get fun modAug(a: Int, b: Int): Int {
        a %= b;
        return a;
    }

    get fun bitwiseOrAug(a: Int, b: Int): Int {
        a |= b;
        return a;
    }

    get fun bitwiseAndAug(a: Int, b: Int): Int {
        a &= b;
        return a;
    }

    get fun bitwiseXorAug(a: Int, b: Int): Int {
        a ^= b;
        return a;
    }

    //
    // Int Compare
    //

    get fun compare1(a: Int, b: Int?): Bool {
        return a == b;
    }

    get fun compare2(a: Int, b: Int?): Bool {
        return a != b;
    }

    get fun compare3(a: Int?, b: Int): Bool {
        return a == b;
    }

    get fun compare4(a: Int?, b: Int): Bool {
        return a != b;
    }

    get fun compare5(a: Int?, b: Int?): Bool {
        return a == b;
    }

    get fun compare6(a: Int?, b: Int?): Bool {
        return a != b;
    }

    get fun compare7(a: Int, b: Int): Bool {
        return a > b;
    }

    get fun compare8(a: Int, b: Int): Bool {
        return a >= b;
    }

    get fun compare9(a: Int, b: Int): Bool {
        return a < b;
    }

    get fun compare10(a: Int, b: Int): Bool {
        return a <= b;
    }

    //
    // Address Compare
    //

    get fun compare11(a: Address, b: Address): Bool {
        return a == b;
    }

    get fun compare12(a: Address, b: Address?): Bool {
        return a == b;
    }

    get fun compare13(a: Address?, b: Address): Bool {
        return a == b;
    }

    get fun compare14(a: Address?, b: Address?): Bool {
        return a == b;
    }

    get fun compare15(a: Address, b: Address): Bool {
        return a != b;
    }

    get fun compare16(a: Address, b: Address?): Bool {
        return a != b;
    }

    get fun compare17(a: Address?, b: Address): Bool {
        return a != b;
    }

    get fun compare18(a: Address?, b: Address?): Bool {
        return a != b;
    }

    //
    // Cell compare
    //

    get fun compare19(a: Cell, b: Cell): Bool {
        return a == b;
    }

    get fun compare20(a: Cell, b: Cell?): Bool {
        return a == b;
    }

    get fun compare21(a: Cell?, b: Cell): Bool {
        return a == b;
    }

    get fun compare22(a: Cell?, b: Cell?): Bool {
        return a == b;
    }

    get fun compare23(a: Cell, b: Cell): Bool {
        return a != b;
    }

    get fun compare24(a: Cell, b: Cell?): Bool {
        return a != b;
    }

    get fun compare25(a: Cell?, b: Cell): Bool {
        return a != b;
    }

    get fun compare26(a: Cell?, b: Cell?): Bool {
        return a != b;
    }

    // Compare dicts

    get fun compare27(a: map<Int, Int>, b: map<Int, Int>): Bool {
        return a == b;
    }

    get fun compare28(a: map<Int, Int>, b: map<Int, Int>): Bool {
        return a != b;
    }

    //
    // Slice compare
    //

    get fun compare29(a: Slice, b: Slice): Bool {
        return a == b;
    }

    get fun compare30(a: Slice, b: Slice?): Bool {
        return a == b;
    }

    get fun compare31(a: Slice?, b: Slice): Bool {
        return a == b;
    }

    get fun compare32(a: Slice?, b: Slice?): Bool {
        return a == b;
    }

    get fun compare33(a: Slice, b: Slice): Bool {
        return a != b;
    }

    get fun compare34(a: Slice, b: Slice?): Bool {
        return a != b;
    }

    get fun compare35(a: Slice?, b: Slice): Bool {
        return a != b;
    }

    get fun compare36(a: Slice?, b: Slice?): Bool {
        return a != b;
    }

    //
    // String compare
    //

    get fun compare37(a: String, b: String): Bool {
        return a == b;
    }

    get fun compare38(a: String, b: String?): Bool {
        return a == b;
    }

    get fun compare39(a: String?, b: String): Bool {
        return a == b;
    }

    get fun compare40(a: String?, b: String?): Bool {
        return a == b;
    }

    get fun compare41(a: String, b: String): Bool {
        return a != b;
    }

    get fun compare42(a: String, b: String?): Bool {
        return a != b;
    }

    get fun compare43(a: String?, b: String): Bool {
        return a != b;
    }

    get fun compare44(a: String?, b: String?): Bool {
        return a != b;
    }

    //
    // IsNull/IsNotNull
    //

    get fun isNull1(a: Int?): Bool {
        return a == null;
    }

    get fun isNotNull1(a: Int?): Bool {
        return a != null;
    }

    get fun isNull2(address: Address?): Bool {
        return address == null;
    }

    get fun isNotNull2(address: Address?): Bool {
        return address != null;
    }

    get fun isNull3(cell: Cell?): Bool {
        return cell == null;
    }

    get fun isNotNull3(cell: Cell?): Bool {
        return cell != null;
    }

    //
    // Advanced Math Operations
    //

    get fun log2(num: Int): Int {
        return log2(num);
    }

    get fun log(num: Int, base: Int): Int {
        return log(num, base);
    }

    get fun pow(base: Int, exp: Int): Int {
        return pow(base, exp);
    }

    get fun pow2(exp: Int): Int {
        return pow2(exp);
    }

    //
    // Precedence
    //

    get fun precedence1(): Int {
        return 5 & 6 | 1 << 5 + 11 * 3 % 12 >> 11;
    }

    get fun precedence2(): Int {
        return 5 & 6 | 1 << (5 + 11) * 3 % 12 >> 11;
    }

    get fun precedence3(): Int {
        return 5 & 6 | 1 << 5 + 11 * (3 % 12) >> 35;
    }

    get fun precedence4(): Int {
        return 5 & 6 | 1 << 5 + (11 * 3) % 12 >> 11;
    }

    get fun precedence5(): Int {
        return 5 | 6 & 8;
    }

    get fun precedence6(): Int {
        return (5 | 6) & 8;
    }

    get fun precedence7(): Int {
        return 5 ^ 6 | 7;
    }

    get fun precedence8(): Int {
        return 5 ^ 6 & 7;
    }

    get fun precedence9(): Int {
        return (5 ^ 6) | 7;
    }

    get fun precedence10(): Int {
        return 5 ^ 6 | 7 & 8;
    }

    get fun precedence11(): Int {
        return (5 ^ 6) | (7 & 8);
    }

    get fun precedence12(): Int {
        return 5 ^ (6 | 7) & 8;
    }

    get fun bitwiseNot1(x: Int): Int {
        return ~~x;
    }

    get fun bitwiseNot2(x: Int): Int {
        return ~~~x;
    }

    get fun bitwiseNot3(x: Int): Int {
        return ~-x;
    }

    get fun bitwiseNot4(x: Int): Int {
        return -~x;
    }
}
