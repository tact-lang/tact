primitive Int;
trait BaseTrait {}

message Message {}

contract Test {
    external (foo: Message) {
        let foo: Int = 0;
    }
}
