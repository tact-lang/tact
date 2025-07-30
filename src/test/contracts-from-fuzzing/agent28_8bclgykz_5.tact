contract NestTest {
    fun nesting() : Int {
        // 36 nested parentheses (should be below problematic level if the bug is at 37)
        return ((((((((((((((((((((((((((((((((((42))))))))))))))))))))))))))))))))))
    }
}
