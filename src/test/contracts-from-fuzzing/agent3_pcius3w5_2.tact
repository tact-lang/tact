/* Test Snippet 1: Simple cross-contract initialization using initOf */

contract Basic {
    init() {}
}

contract Tester {
    fun getBasicInit() : StateInit {
         return initOf Basic();
    }
}
