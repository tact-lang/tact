primitive Slice;
trait BaseTrait {

}

message SomeMessage {

}

contract SomeContract {
    receive() {
        let msg = SomeMessage{};
        let s1 = SomeMessage{}.toSlice();
        let s2 = msg.toSlice();
        let c1 = SomeMessage{}.toCell();
        let c2 = msg.toCell();
    }
}
