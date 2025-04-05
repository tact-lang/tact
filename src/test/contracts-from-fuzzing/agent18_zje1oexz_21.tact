/// This test verifies extension mutation functions on a primitive type (Int).
/// The extension function incMut increments the integer value by 1.

extends mutates fun incMut(self: Int) {
    self += 1;
}

contract TestIncMut {
    receive() {
        let x = 5;
        x.incMut();
        // Expect x to be 6
        reply(x.toString());
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
