trait TBase {
    // Abstract function to be implemented in a derived trait or contract
    abstract fun a(): Int;
}

trait TMid with TBase {
    // Provide a default implementation for a()
    override fun a(): Int {
        return 100;
    }
}

contract Final() with TMid {
    // Receiver calling the inherited function a()
    receive() {
        let result = self.a();  // expected to be 100 from TMid
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: result.toString().asComment()
        });
    }
}
