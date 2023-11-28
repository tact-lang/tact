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
}