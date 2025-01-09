primitive Int;
primitive String;

const e: String = "qwe";

fun test(): String {   
    try {
        return e;
    } catch (err) {
        let e: String = "rty";
        return e;
    }
}