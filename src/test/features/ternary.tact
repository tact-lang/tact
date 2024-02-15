contract TernaryTester {

    init() {
        
    }
    
    receive() {
        // Deploy
    }

    get fun test1(a: Int): Int {
        return a == 123 ? 1 : 2;
    }

    get fun test2(a: Int): Int {
        return a == 123 ? a * 2 : a * 3;
    }

    get fun test3(a: Int, b: Int): Int {
        return a == b ? 1 : 2;
    }

    get fun test4(a: Int, b: Int): Int {
        return a == 123 ? (b == 456 ? 1 : 2) : (b == 789 ? 3 : 4);
    }

    // ternary operator is right-associative (see the next test)
    // returns 1
    get fun test5(): Int {
        return true ? 1 : false ? 2 : 3;
    }

    // the following parentheses are actually not needed
    // returns 1
    get fun test6(): Int {
        return true ? 1 : (false ? 2 : 3);
    }

    // returns 2
    get fun test7(): Int {
        return false ? 1 : true ? 2 : 3;
    }

    // returns 3
    get fun test8(): Int {
        return false ? 1 : false ? 2 : 3;
    }

    // returns 3
    get fun test9(): Int {
        return (true ? false : true) ? 2 : 3;
    }

    // the following is equivalent to an `if ... else if ... else if ... else ...` chain
    get fun test10(a: Int): Int {
        return
              (a == 1) ? 42
            : (a == 2) ? 43
            : (a == 3) ? 44
            : 45;
    }
}