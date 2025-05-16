// Chain of structs with optional fields at every level, filled
struct Sub {
    v: Int?;
}
struct Mid {
    s: Sub?;
}
contract Test {
    m: Mid = Mid{
        s: Sub{
            v: 123
        }
    };
    init() {}
}