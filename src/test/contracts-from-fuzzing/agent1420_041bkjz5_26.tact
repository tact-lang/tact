struct Combo {
    a: Address?;
    s: Slice?;
}

contract TestContract {
    c: Combo = Combo{ a: null, s: null };
    init() {}
}