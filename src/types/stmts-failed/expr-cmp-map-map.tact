primitive Int;
primitive Address;
primitive Bool;

fun foo(m1: map<Int, Address>, m2: map<Address, Int>): Bool {
    return m1 == m2;
}
