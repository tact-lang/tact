trait BaseTrait {}

primitive Int;
primitive Cell;

message Test {
    s: Cell? as remaining;
    a: Int;
}
