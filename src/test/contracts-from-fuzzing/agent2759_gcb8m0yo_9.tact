struct Inner {
    flag: Bool;
    msg: MessageTest;
}

message(1) MessageTest {
    val: Int;
}

contract StructWithMessageField {
    field: Inner;

    init() {
        self.field = Inner{
            flag: true,
            msg: MessageTest{ val: 7 }
        };
    }
}