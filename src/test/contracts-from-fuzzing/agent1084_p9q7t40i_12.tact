struct WithStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String? = null;
}

contract TestContract {
    d: WithStrings = WithStrings{};
    init() {}
    receive() {}
}