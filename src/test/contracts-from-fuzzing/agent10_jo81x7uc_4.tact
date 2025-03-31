/* Test 3 Revised: Circular Dependency without non-existent methods */

contract A {
    init() {
         // Circular dependency: A calls initOf B
         let dummy = initOf B();
    }
    fun testA(): Int { return 10; }
}

contract B {
    init() {
         // Circular dependency: B calls initOf A
         let dummy = initOf A();
    }
    fun testB(): Int { return 20; }
}

contract Tester {
    fun run(): Int {
         // Trigger compilation by calling initOf
         let a = initOf A();
         let b = initOf B();
         return 1;
    }
}
