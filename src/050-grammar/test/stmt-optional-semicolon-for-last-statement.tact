// what is covered: assignment, let
fun test1() {
    let i: Int = 1;
    while(i >= 10 || i <= 100) { i += 1 }
    let i = 42
}

// what is covered: return without expression
fun test2() { return }

// what is covered: return with expression
fun test3(): Int { return 42 }

// what is covered: do-until, expression statement
fun test4(): Int {
    do { 21 + 21 } until (true && true)
}