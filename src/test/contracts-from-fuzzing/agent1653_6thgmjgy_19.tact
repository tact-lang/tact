// Test struct with large amounts of optional fields
struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
}

contract TestContract {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            o1: null,
            o2: true,
            o3: null,
            o4: 99,
            o5: null
        };
    }
}