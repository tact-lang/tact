// Nested optional with explicit default nulls inside structs
struct TestS {
    x: Int?;
    y: Bool?;
}

contract OptStructDefault {
    s: TestS = TestS{ x: null, y: null };

    init() {
        // no assignments needed
    }
}
