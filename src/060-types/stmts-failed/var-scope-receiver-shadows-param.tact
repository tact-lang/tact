primitive Int;
trait BaseTrait {}

message Message {}

contract Test {
    receive (foo: Message) {
        let foo: Int = 0;
    }
}
