trait T1 {
    fun f(): Int {
        return 100;
    }
}

trait T2 with T1 {
    // No override; inherits f() from T1
}

contract TraitChain() with T2 {
    receive() {
        let r = self.f(); // Expected to be 100
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: r.toString().asComment()
        });
    }
}
