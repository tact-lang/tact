struct Deep {
    s1: Int = 1;
    s2: Bool = false;
    s3: Int? = null;
    s4: Bool? = null;
}

contract DeepDefaults {
    deep: Deep = Deep{};
}