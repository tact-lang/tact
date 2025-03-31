fun greet(): String {
    return "Hello, Tact!";
}

fun add(a: Int, b: Int): Int {
    return a + b;
}

fun main() {
    // Call greet() and add(), and use dump() to output values
    let greeting: String = greet();
    dump(greeting);  // Expected output: Hello, Tact!
    
    let sum: Int = add(20, 22);
    dump(sum);  // Expected output: 42

    // Since direct concatenation of Strings via '+' isn't supported in Tact,
    // we use a StringBuilder to concatenate strings.
    let sb: StringBuilder = beginString();
    sb.append(greeting);
    sb.append(" Sum: ");
    sb.append(sum.toString());
    let combined: String = sb.toString();
    dump(combined);  // Expected output: Hello, Tact! Sum: 42
}
