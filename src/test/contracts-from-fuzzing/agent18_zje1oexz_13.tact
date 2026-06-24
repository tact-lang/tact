contract CompareCode() {
    receive() {
        // Get the current contract's code as a Cell
        let code1: Cell = myCode();
        // Get the official code cell obtained via the codeOf operator
        let code2: Cell = codeOf CompareCode;
        
        // Convert both cells to slices for comparison
        let slice1: Slice = code1.asSlice();
        let slice2: Slice = code2.asSlice();
        
        // Compare the slices; if equal, reply "OK", otherwise "ERROR"
        if (slice1 == slice2) {
            reply("OK");
        } else {
            reply("ERROR");
        }
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
