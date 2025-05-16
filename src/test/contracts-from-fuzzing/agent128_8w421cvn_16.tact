struct Msgs {
    msg1: String = "a very very very very very very very very very very long message";
    msg2: String = "another super super super long string just for storage fuzz test";
}

contract TestContract {
    m: Msgs = Msgs{};
}