fun baz(): Int {
    dump("baz() called");
    return 1;
}

fun bar(): Int {
    dump("bar() called");
    return baz() + 1;
}

fun foo(): Int {
    dump("foo() called");
    return bar() + 1;
}

fun main(): Int {
    dump("main() called");
    let result: Int = foo();
    let sb: StringBuilder = beginString();
    sb.append("Final result: ");
    sb.append(result.toString());
    dump(sb.toString());
    return result;
}
