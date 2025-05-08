message MyMessage1 {
    value: Int;
}

message MyMessage2 {
    text: String;
}

contract TestContract {
    receive(msg: MyMessage1) {
        let val: Int = msg.value;
    }

    receive(msg: MyMessage2) {
        let val: String = msg.text;
    }
}