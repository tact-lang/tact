struct Complicated {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    get fun complicated(): Complicated {
        return Complicated{};
    }
}