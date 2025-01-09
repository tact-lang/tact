primitive Int;

fun test(x: Int, y: Int?): Int {
    return 123;
}

extends fun test_extends(self: Int, y: Int?): Int {
    return 123;
}

extends fun test_extends_self(self: Int?, y: Int): Int {
    return 123;
}

extends mutates fun test_mutates(self: Int, y: Int?): Int {
    return 123;
}

extends mutates fun test_mutates_self(self: Int?, y: Int): Int {
    return 123;
}

extends mutates fun test_mutates_self_opt(self: Int?, y: Int): Int? {
    return null;
}