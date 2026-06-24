message FooMsg { data: Int; }

contract MsgField {
    m: FooMsg = FooMsg{ data: 42 };
}