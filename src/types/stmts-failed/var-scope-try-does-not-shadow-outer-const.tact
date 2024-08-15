primitive Int;
primitive String;

const e: String = "qwe";

fun test(): String {
    try {
        let e: String = "rty";
        return e;
    } catch (err) {
        return "err";
    }
}