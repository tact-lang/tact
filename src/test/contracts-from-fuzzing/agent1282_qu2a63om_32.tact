// Nested struct with multiple wrapped optionals
struct Profile {
    name: String;
    age: Int?;
}

struct Wrapper {
    profile: Profile?;
    score: Int;
}

contract NestedWrappedOpt {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            profile: null,
            score: 100,
        };
    }
}
