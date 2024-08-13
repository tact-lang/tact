primitive Int;

const foo: Int = 42;

fun bar(): Int {
    try { }
    catch (foo) {   // <-- `foo` shadows global const `foo`
    }
    return foo;
}

