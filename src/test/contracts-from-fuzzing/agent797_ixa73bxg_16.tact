struct InnerWithDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract TestOptStructWithInnerDefaults {
    s: InnerWithDefaults? = null;

    init() {}
}