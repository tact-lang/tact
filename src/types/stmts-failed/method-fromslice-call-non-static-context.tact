primitive Slice;
trait BaseTrait {}

message SomeMessage {}

contract SomeContract {
    init(slice: Slice) {
        let res = SomeMessage {}.fromSlice(slice);
    }
}
