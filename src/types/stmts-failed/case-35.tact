primitive Int;
primitive String;

fun test(): String {
    try {
        return "qwe";
    } catch (e) {
        return e;
    }
    return "test";
}