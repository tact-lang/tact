primitive Int;
primitive String;

fun test(): String {
    let e: String = "qwe";
    try {
        return e;
    } catch (err) {
        let e: String = "rty";
        return "err";
    }
}