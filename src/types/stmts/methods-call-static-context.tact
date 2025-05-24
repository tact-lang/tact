primitive Cell;
primitive Slice;
trait BaseTrait {}

message SomeMessage {}

contract SomeContract {
    init(slice: Slice, cell: Cell) {
        let mes1 = SomeMessage.fromSlice(slice);
        let mes2 = SomeMessage.fromCell(cell);
        let opcode = SomeMessage.opcode();
    }
}
