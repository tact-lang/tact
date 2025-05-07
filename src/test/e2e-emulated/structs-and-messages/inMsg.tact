message MsgEmpty {}
message MsgSingle { a: Int }
message MsgComplex { a: Int; b: Cell }
message MsgWithRemaining { a: Int; b: Cell; s: Slice as remaining }

contract Test {
    receive() { throwIf(128, inMsg() != emptySlice()) }

    receive(msg: MsgEmpty) { throwIf(128, msg.toSlice() != inMsg()) }
    receive(msg: MsgSingle) { throwIf(128, msg.toSlice() != inMsg()) }
    receive(msg: MsgComplex) { throwIf(128, msg.toSlice() != inMsg()) }
    receive(msg: MsgWithRemaining) { throwIf(128, msg.toSlice() != inMsg()) }
}
