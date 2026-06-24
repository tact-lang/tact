struct ManyStrings {
    s1: String = "one";
    s2: String = "two";
    s3: String = "three";
    s4: String?;
    s5: String?;
}

contract StringHeavy {
    data: ManyStrings = ManyStrings{};
}