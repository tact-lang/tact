message(0x123) MyMsg {
    foo: Int = 7;
}

contract MessageFieldDefault {
    m: MyMsg = MyMsg{ foo: 77 };
}