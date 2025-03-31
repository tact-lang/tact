contract IllegalGetterTest {
    // Regular getter function using 'get' attribute on a function body written in Tact (not asm) 
    get fun illegalGetter2(): Int {
        return 123;
    }
}
