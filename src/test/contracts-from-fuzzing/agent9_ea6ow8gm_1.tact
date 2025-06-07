contract B {
    init() {}
}

contract A {
    fun test(): Bool {
         let initB = initOf B();
         return true;
    }
}
