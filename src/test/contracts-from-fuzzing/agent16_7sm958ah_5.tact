trait TTest {
    // Virtual constant A defined normally
    virtual const A: Int = 10;
    // Virtual constant B defined using self.A
    virtual const B: Int = self.A + 5;
}

contract C() with TTest {
    // Override the virtual constants
    override const A: Int = 20;
    override const B: Int = self.A + 5;

    receive() {
         let a = self.A;  // expected to be 20
         let b = self.B;  // expected to be 25
         require(a == 20, "A incorrect");
         require(b == 25, "B incorrect");
         reply("constants ok");
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
