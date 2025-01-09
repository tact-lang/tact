fun foo() { return }
fun bar() { return }

fun baz() {
    true ? foo() : bar();
}