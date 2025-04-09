struct Complex {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: String = "";
    e: Cell?;   // make Cell optional so null default allowed
    f: Slice?;  // same for Slice
    g: Address?;
}

contract TestContract {
    complex: Complex = Complex{};
    done: Bool = false;
}