struct DefaultsEdge {
    i: Int = 42;
    b: Bool = true;
    s: String = "ok";
}

contract DefaultsEdgeTest {
    data: DefaultsEdge = DefaultsEdge{};
    init() {}
}