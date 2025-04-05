// message with bool optional
message BoolOptTest {
    b: Bool?;
}

contract Test {
    receive(msg: BoolOptTest) {
        let x = msg.b;
    }
}