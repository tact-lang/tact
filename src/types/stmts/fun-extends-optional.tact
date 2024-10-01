primitive Int;

fun test(x: Int, y: Int?): Int {
    if (y == null) {
        return x;
    }
    return x + y!!;
}

extends fun test_extends(self: Int, y: Int?): Int {
    if (y == null) {
        return self;
    }
    return self + y!!;
}

extends fun test_extends_self(self: Int?, y: Int): Int {
    if (self == null) {
        return y;
    }
    return self!! + y;
}

extends mutates fun test_mutates(self: Int, y: Int?): Int {
    if (y == null) {
        return self;
    }
    self += y!!;
    return self;
}

extends mutates fun test_mutates_self(self: Int?, y: Int): Int {
    if (self == null) {
        return y;
    }
    self = self!! + y;
    return self!!;
}

extends mutates fun test_mutates_self_opt(self: Int?, y: Int): Int? {
    if (self == null) {
        return null;
    }
    self = self!! + y;
    return self;
}