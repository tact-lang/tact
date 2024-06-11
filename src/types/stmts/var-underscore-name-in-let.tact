primitive Int;

fun someImpureFunction(): Int {
    return 123;
}

fun test(): Int {
    let _: Int = someImpureFunction();
    return 123;
}
