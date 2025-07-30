message(123) MyMsg2 {
    foo: Int;
    bar: String?;
    baz: Bool;
}

contract MsgOptVal {
    val: MyMsg2?;

    init() {
        self.val = MyMsg2{
            foo: 77,
            bar: null,
            baz: true,
        };
    }
}