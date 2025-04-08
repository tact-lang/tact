struct OptionalNestLevel2 {
    opt: Int?;
}

struct OptionalNestLevel1 {
    inner: OptionalNestLevel2?;
}

contract OptionalNestTest {
    data: OptionalNestLevel1;

    init() {
        self.data = OptionalNestLevel1{ inner: null };
    }
}