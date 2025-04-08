message(0x42) Msg {
    val: Int = 123;
    text: String = "hi";
}

contract TestContract {
    m: Msg = Msg{};
}