struct MixDefaultOpt {
    a: Int = 42;
    b: Bool? = null;
    c: String = "test";
    d: String? = null;
}

contract MixedDefaultOpt {
    payload: MixDefaultOpt = MixDefaultOpt{};
}