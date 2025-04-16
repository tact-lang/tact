struct TestWithoutSemicolon { a: Int }

fun main() : Int {
    let t = TestWithoutSemicolon{ a: 5 };
    return t.a; // Expected 5
}
