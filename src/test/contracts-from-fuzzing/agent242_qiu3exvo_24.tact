struct Leaf { val: Int? = null; }
struct Mid { leaf: Leaf? = null; extra: Bool? = true; }

contract NestedDefaults {
    data: Mid = Mid{};
}