trait BaseTrait {

}

message SomeMessage {

}

contract SomeContract {
    receive() {
        let res = SomeMessage.toCell();
    }
}
