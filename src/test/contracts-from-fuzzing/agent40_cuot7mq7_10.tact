contract TestThrowUnless {
    receive() {}
    
    fun test(): Int {
        throwUnless(1024, true);
        return 42;
    }
}
