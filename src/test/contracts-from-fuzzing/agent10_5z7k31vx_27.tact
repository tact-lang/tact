inline fun add(a: Int, b: Int) : Int { 
    return a + b; 
}

fun testInline() : Int { 
    return add(5, 7); 
}

fun main() : Int {
    return testInline();
}
