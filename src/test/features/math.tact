import "@stdlib/deploy";

contract MathTester with Deployable {
    init() {

    }

    get fun add(a: Int, b: Int): Int {
        return a + b;
    }

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
}