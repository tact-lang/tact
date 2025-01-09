primitive Int;

fun test(): Int {
    let m: map<Int, Int> = emptyMap();
    foreach (k, v in m) {
        // something
    }
    return v;
}
