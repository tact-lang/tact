struct MultiStringDefaults {
    a: String = "";
    b: String = "";
    c: String = "";
    d: String = "";
    e: String = "";
    f: String = "";
    g: String = "";
    h: String = "";
    i: String = "";
    j: String = "";
}

contract ManyEmptyStrings {
    s: MultiStringDefaults = MultiStringDefaults{};
}