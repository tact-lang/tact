primitive String;

fun test(): String {
    let a: String = "foo";
    a %= "bar";
    return a;
}