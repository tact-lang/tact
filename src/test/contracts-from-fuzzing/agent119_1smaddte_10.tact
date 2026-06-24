struct MyPair {
    a: Int;
    b: Int;
}

fun simple_return(): Int {
    return 1;
}

fun no_semicolon_return(): Int {
    return 2
}

fun comb_return(a: Bool): Int {
    if (a) {
        return 10;
    } else {
        return 20;
    }
}

fun nested_block_return(a: Bool): Int {
    if (a) {
        { return 30; }
        // Unreachable code intentionally omitted
    } else {
        return 40;
    }
}

fun implicit_expression() {
    dump(100);
    return;
}

fun return_optional(a: Bool): Int? {
    if (a) {
        return 5;
    } else {
        return null;
    }
}

contract GetterTest {
    v: Int = 7;

    get fun getV(): Int {
       return self.v;
    }

    get fun getMyPair(): MyPair {
       return MyPair{
          a: self.v,
          b: self.v * 2
       };
    }
}

contract ReceiverTest {
    receive() {
       dump("Hello");
       return;
    }
}
