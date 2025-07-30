/// Snippet 4: Test struct with default value and mandatory field
struct TestStruct {
    a: Int = 5;
    b: Int;
}

fun main() : Int {
    let t = TestStruct{ b: 10 };
    return t.a + t.b; // Expected: 5 + 10 = 15
}
