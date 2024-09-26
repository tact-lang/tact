primitive Bool;

fun test(): Bool {
    let a: Bool = false;
    a &&= true;
    a ||= false;
    return a;
}