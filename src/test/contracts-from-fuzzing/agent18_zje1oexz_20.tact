/// This test verifies the use of a struct with a "remaining" field as described in the documentation.
/// The struct RemTest has a fixed value field and a remaining field that captures any leftover bits.

struct RemTest {
    fixed: Int as uint8;
    rest: Cell as remaining;
}

contract TestRemaining() {
    receive() {
        // Instantiate a struct with a fixed value and no extra cell bits (an empty cell) for the remainder
        let cellStruct: Cell = RemTest{ fixed: 7, rest: emptyCell() }.toCell();
        
        // Deserialize the cell back into the struct
        let recovered: RemTest = RemTest.fromCell(cellStruct);
        
        // Reply with the value of 'fixed' field
        reply(recovered.fixed.toString());
    }
}

/// Global inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
