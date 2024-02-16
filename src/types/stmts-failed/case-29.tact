primitive Int;
primitive Bool;

fun sample(): Int {
    return true ? 1 : (false ? true : 2);
}
