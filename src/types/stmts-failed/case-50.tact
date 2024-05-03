primitive Int;

fun test(): Int {
    let m: map<Int, Int> = emptyMap();
    foreach (k, v in m) {
        let x: Int = 123;
    }
    return x;
}
