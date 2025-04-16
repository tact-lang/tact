trait TraitAbstract {
    abstract fun plusTen(x: Int): Int;
}

contract TestAbstract() with TraitAbstract {
    override fun plusTen(x: Int): Int {
        return x + 10;
    }

    receive() {
        reply(self.plusTen(5).toString());
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
