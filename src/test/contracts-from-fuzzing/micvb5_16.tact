fun hello(): String {
    dump("hello() called");
    return "Hello";
}

fun world(): String {
    dump("world() called");
    return " World";
}

fun greet(): String {
    dump("greet() called");
    // Use StringBuilder to concatenate strings
    let sb: StringBuilder = beginString();
    sb.append(hello());
    sb.append(world());
    return sb.toString();
}

fun foo(): Int {
    dump("foo() called");
    return 100;
}

fun bar(): Int {
    dump("bar() called");
    return foo() + 23;
}

fun main() {
    dump("main() started");
    let greeting: String = greet();
    // Concatenate using StringBuilder instead of + operator
    let sb: StringBuilder = beginString();
    sb.append("Greeting: ");
    sb.append(greeting);
    dump(sb.toString());

    let resultBar: Int = bar();
    let sb2: StringBuilder = beginString();
    sb2.append("Result from bar(): ");
    sb2.append(resultBar.toString());
    dump(sb2.toString());
}
