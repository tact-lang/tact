struct Example { field: Int }

fun testNaming(s: Example): Int {
    let Example { field: varFromField } = s;
    return varFromField;
}

fun main() : Int {
    return testNaming(Example { field: 123 });
}
