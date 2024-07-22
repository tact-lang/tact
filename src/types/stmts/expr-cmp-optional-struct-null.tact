primitive Int;
primitive Bool;
struct S { f: Int }

fun foo(s: S?): Bool {
    if (s != null) {
        return s!!.f == 42
    }
    return false;
}

