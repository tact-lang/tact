struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int?; // implicitly null
}

contract ParamWrap(
    inner: WithDefaults?,
    val: Int?,
    flag: Bool?,
) {
    receive() {
        // noop
    }
}