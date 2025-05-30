// Attempt to create an empty struct with defaulted optional fields
struct AlmostEmpty {
    foo: Int? = null;
}

contract EmptyTest {
    storage: AlmostEmpty;
    init() {
        self.storage = AlmostEmpty{};
    }
}