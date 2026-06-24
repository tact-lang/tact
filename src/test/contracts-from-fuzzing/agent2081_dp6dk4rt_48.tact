message(123) MsgEmpty {}

contract MessageWithEmptyStruct {
    init() {}
    receive(_: MsgEmpty) {}
}