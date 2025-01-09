primitive Int;

fun test() {
    let m: map<Int, Int> = emptyMap();
    foreach (m, v in m) {
        // something
    }
}
