message(99) MyMsg {
    foo: Int;
}

contract MixedOptParams(
    count: Int?,
    name: String?,
    msgData: MyMsg?,
) {}