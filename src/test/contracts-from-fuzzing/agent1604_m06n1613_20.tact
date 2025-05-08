struct InnerLevel {
    x: Int;
}

contract DefaultTest {
    stored: InnerLevel = InnerLevel { x: 10 };

    receive() {}
}