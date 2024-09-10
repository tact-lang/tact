primitive Int;

fun rec(): Int {
    let m: map<Int, Int> = null;
    foreach (rec, _ in m) {   // shadowing error
        42/0;
    }
    return rec();
}
