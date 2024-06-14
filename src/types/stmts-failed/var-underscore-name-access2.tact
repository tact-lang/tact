primitive Int;

fun test(): Int {
    let m: map<Int, Int> = emptyMap();
    let x: Int = 0;
    foreach (_, v in m) {
        x += _;
    }
    return x;
}
