message(0x1234) SimpleMsg {
    val: Int = 10;
    flag: Bool = true;
}

contract MessageFieldInit {
    m: SimpleMsg = SimpleMsg{};
}