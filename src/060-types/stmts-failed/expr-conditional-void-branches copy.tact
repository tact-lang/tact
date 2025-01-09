primitive Int;

fun foo() { return }

fun bar(): Int {
    let voidVar = true ? foo() : foo();
    return 42;
}
