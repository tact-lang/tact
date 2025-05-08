struct SOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
}

contract TestContract {
    b: SOptionals = SOptionals{};
    init() {}
    receive() {}
}