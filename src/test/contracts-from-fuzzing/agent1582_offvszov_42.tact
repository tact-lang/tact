struct SDefaultOpt {
    opt1: Int? = null;
    opt2: Bool? = null;
    opt3: String? = null;
}

contract StructWithDefaultsOpt {
    sd: SDefaultOpt = SDefaultOpt{};

    receive() {}
}