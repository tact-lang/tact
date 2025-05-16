message(123) MyMsg { foo: Int; }

contract C {
    state: MyMsg = MyMsg{ foo: 0 };
}