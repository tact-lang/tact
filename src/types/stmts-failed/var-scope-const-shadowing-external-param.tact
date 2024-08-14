primitive Int;
trait BaseTrait {}

message Message {}

const foo: Int = 42;

contract Test {
    external (foo: Message) { // <-- `foo` shadows global const `foo`
    }
}
