primitive Int;
primitive Address;
primitive Bool;

fun foo(m: map<Int, Address>): Bool {
    return m == null;
}
