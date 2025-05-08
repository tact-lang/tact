struct X { a: Int; b: Int }

fun testDestructuringTrailingComma() : Int {
    let X { a, b, } = X { a: 10, b: 20, };
    return a + b;
}

fun main() : Int {
    return testDestructuringTrailingComma();
}
