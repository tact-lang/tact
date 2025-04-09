trait BaseTrait {}

primitive Int;
primitive Cell;

message Test {
    a: Int;
    s: Cell? as remaining;
}
