struct Two { first: Int; second: String }

fun testDestructure(s: Two) : Int {
    let Two { first, .. } = s;
    return first;
}

fun main() : Int {
    return testDestructure(Two { first: 42, second: "hello" });
}
