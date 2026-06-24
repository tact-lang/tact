struct Two { first: Int; second: String }

fun testDestructure1(s: Two) : Int {
    let Two { first, second } = s;
    return first;
}

fun main() : Int {
    return testDestructure1(Two { first: 42, second: "hello" });
}
