struct MyStruct {
    value: Int;
}

message StructMessage {
    my_struct: MyStruct;
}

contract TestContract {
    receive(msg: StructMessage) {
    }
}