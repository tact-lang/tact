trait A {
    virtual fun foo(x: Int): Int {
        return x + 1;
    }
}

trait B with A {
    override fun foo(x: Int): Int {
        return (x + 1) + 2;
    }
}

contract C() with B {
    receive() {
         let r = self.foo(3);  // Expected: (3+1)+2 = 6
         require(r == 6, "foo error");
         reply("chain ok");
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
