// Recursive cross-contract initialization

contract A {
    // Function in A that uses initOf on B
    fun callB() : StateInit {
        return initOf B();
    }
}

contract B {
    // Function in B that uses initOf on A
    fun callA() : StateInit {
        return initOf A();
    }
}
