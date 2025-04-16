contract A {
    init() { }
}

contract B {
    fun test(): Int {
         let s = initOf A();
         return 42;
    }
}
