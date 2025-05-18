primitive Cell;
trait BaseTrait {

}

message SomeMessage {

}

contract SomeContract {
    init(cell: Cell) {
        let res = SomeMessage{}.fromCell(cell);
    }
}
