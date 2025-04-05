/// TestTrailingComma demonstrates that trailing commas in parameter lists and calls are allowed.

fun add(a: Int, b: Int, ): Int {
    return a + b;
}

contract TestTrailingComma {
    receive() {
        let result = add(2, 3,);
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
