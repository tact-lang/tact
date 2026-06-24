
struct NestedLevel3 {
    val: Int?;
}

struct NestedLevel2 {
    val: NestedLevel3?;
}

struct NestedLevel1 {
    val: NestedLevel2?;
}

contract DeepOptionalNested {
    data: NestedLevel1?;

    init() {
        self.data = null;
    }
}
