primitive Int;

const A: Int = recurse();

fun recurse(): Int {
    return recurse();
}
