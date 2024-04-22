primitive Int;
primitive String;

fun test(): String {
    let e: String = "qwe";
    try {
        return e;
    } catch (e) {
        return e;
    }
    return "test";
}