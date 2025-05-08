// Large struct with many optional fields with no init assignment
struct UnassignedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract UnassignedOptionalFields {
    data: UnassignedOptionals;

    init() {
        self.data = UnassignedOptionals{};
    }
}