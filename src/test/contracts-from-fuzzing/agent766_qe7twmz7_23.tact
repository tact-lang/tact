struct WithLong {
    sentence: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
}

contract LongDefaultStringTest {
    val: WithLong = WithLong{};
}