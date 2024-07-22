primitive Int;
primitive Address;
primitive Bool;

fun foo(m1: map<Int, Address>, m2: map<Int, Address>): Bool {
    return m1 == m2;
}
