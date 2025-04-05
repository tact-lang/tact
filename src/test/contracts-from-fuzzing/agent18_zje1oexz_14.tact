asm fun rawReserveExtra(amount: Int, extraAmount: Cell, mode: Int) { RAWRESERVEX }

contract TestAsm() {
    receive() {
        // Call the assembly function rawReserveExtra with a Toncoin value of 0.1, an empty cell, and mode 0
        rawReserveExtra(ton("0.1"), emptyCell(), 0);
        reply("OK");
    }
}

inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
