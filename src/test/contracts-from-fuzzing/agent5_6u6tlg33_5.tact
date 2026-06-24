trait TAlpha {
    fun alpha(): Int {
        return 100;
    }
}

trait TBeta with TAlpha {
    override fun alpha(): Int {
        return 200;
    }
    fun beta(): Int {
        return self.alpha() + 1;
    }
}

contract Diamond() with TBeta {
    receive() {
        let r = self.beta(); // Expected: 200 + 1 = 201
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: r.toString().asComment()
        });
    }
}
