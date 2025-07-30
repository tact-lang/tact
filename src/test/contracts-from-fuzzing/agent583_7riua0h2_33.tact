struct DE {
    xx: Int = 1;
    yy: Bool = false;
    zz: String = "hi";
}

contract InnerDefaults {
    s: DE = DE{};
}