fun foo(a: Int,): Int { 
    return a; 
}

fun bar(): Int {
    // Testing trailing comma in function call from a normal function
    return foo(5,);
}

contract Test {
    receive() {
        bar();
    }
}
