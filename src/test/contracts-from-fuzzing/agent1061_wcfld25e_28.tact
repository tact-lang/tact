// nested optionals combined: optional struct with inner optional, and optional primitive
struct Child { score: Int?; }

struct Parent { child: Child?; mark: Bool?; }

contract Test {
    data: Parent?;

    init() {
        self.data = Parent{
            child: null,
            mark: null
        };
    }
}