trait MyTrait {
    abstract fun foo(): Int;
    virtual fun bar(): Int {
        return 10;
    }
    abstract const absC: Int;
    virtual const virC: Int = 100;
}

contract TestContract() with MyTrait {
    override fun foo(): Int { 
        return 42;
    }
    override const absC: Int = 77;
    override const virC: Int = 200;

    receive() {
         // This receiver is used to force compilation
         let result = self.foo() + self.bar();
         // Expected: foo() = 42, bar() = 10, so result = 52
         reply(result.toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
