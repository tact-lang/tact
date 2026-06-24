struct OptionalNestLevel2 {
    inner: OptionalNestLevel1?;
}

struct OptionalNestLevel1 {
    value: Int?;
}

contract OptionalNestTest {
    st: OptionalNestLevel2;

    init() {
        self.st = OptionalNestLevel2{
            inner: OptionalNestLevel1{value:null},
        };
    }
}