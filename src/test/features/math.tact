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
}