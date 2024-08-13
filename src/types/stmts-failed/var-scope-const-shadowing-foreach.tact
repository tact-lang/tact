primitive Int;

const foo: Int = 42;

fun bar() {
    let m: map<Int, Int> = null;
    foreach (foo, _ in m) {  // <--- attempt to shadow `foo` const
        // do nothing
    }
}