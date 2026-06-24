// Test optional containing struct inside struct with optionals
struct Small {
    val: Int?;
}

struct Medium {
    s: Small?;
}

struct Large {
    m: Medium?;
}

contract OptionalChains {
    data: Large?;

    init() {
        self.data = Large{
            m: Medium{
                s: null,
            },
        };
    }
}