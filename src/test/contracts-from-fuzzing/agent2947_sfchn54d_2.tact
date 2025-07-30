struct Nested { value: Int?; }

struct Outer { nested: Nested; }

contract TestDeepOptional {
    data: Outer;

    init() {
        self.data = Outer { nested: Nested { value: null } };
    }
}