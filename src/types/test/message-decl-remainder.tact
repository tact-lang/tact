trait BaseTrait { }

primitive Int;
primitive Cell;

message Test {
    a: Int;
    b: Int;
    s: Cell as remaining;
}
