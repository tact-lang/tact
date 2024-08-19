primitive Int;

fun rec(): Int {
    let rec: Int = 42;  // shadowing error
    return rec;
}
