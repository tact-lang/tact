struct InnerDefaults {
    x: Int = 5;
    y: Bool = true;
}

struct Wrapper {
    v: InnerDefaults? = null;
}

contract OptionalStructDefault {
    s: Wrapper = Wrapper{};
}