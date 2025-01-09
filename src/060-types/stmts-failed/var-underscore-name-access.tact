primitive Int;

fun test(): Int {
    let m: map<Int, Int> = emptyMap();
    foreach (_, _ in m) {
        return _;
    }
    return 0;
}
