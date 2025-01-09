primitive Int;

fun test() {
    let m: map<Int, Int> = emptyMap();
    let a: Int = 4;
    foreach (k, v in m) {
        let a: Int = 5;
    }
}
