primitive Int;

const foo: Int = 42;

fun bar(foo: Int): Int {  // <-- fun param `foo` shadows global const `foo`
    return foo;
}
