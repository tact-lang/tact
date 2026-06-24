struct Flags {
    a: Bool = false;
    b: Bool = true;
}

struct Complex {
    id: Int = 1;
    text: String = "t";
    optVal1: Int? = null;
    optVal2: String?;
    nestedFlags: Flags = Flags{};
    nestedOptFlags: Flags? = null;
}

contract TestComplexNestedOptionals {
    data: Complex = Complex{};
}