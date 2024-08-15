primitive Int;
primitive String;

fun test(): String {
    let e: String = "qwe";
    try {
        let e: String = "rty";
        return e;
    } catch (err) {
        return "err";
    }
    return "test";
}