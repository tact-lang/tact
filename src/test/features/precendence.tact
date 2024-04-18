import "@stdlib/deploy";

contract PrecendenceTester with Deployable {
    init() {

    }

    get fun test1(): Int {
        return 5 & 6 | 1 << 5 + 11 * 3 % 12 >> 11;
    }

    get fun test2(): Int {
        return 5 & 6 | 1 << (5 + 11) * 3 % 12 >> 11;
    }

    get fun test3(): Int {
        return 5 & 6 | 1 << 5 + 11 * (3 % 12) >> 35;
    }

    get fun test4(): Int {
        return 5 & 6 | 1 << 5 + (11 * 3) % 12 >> 11;
    }
}