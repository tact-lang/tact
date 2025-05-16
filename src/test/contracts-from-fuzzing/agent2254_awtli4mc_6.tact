struct NestedOptional1 {
    x: Int?;
    y: Bool?;
}

struct NestedOptional2 {
    part: NestedOptional1?;
}

contract TestContract {
    data: NestedOptional2;

    init() {
        self.data = NestedOptional2 {
            part: null
        };
    }
}