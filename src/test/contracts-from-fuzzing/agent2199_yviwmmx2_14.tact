struct NestedOptionals {
    first: Int?;
    second: Bool?;
    sub: SubStruct?;
}

struct SubStruct {
    data: String?;
}

contract NestedOptionalTest {
    val: NestedOptionals;
    init() {
        self.val = NestedOptionals{
            first: null,
            second: true,
            sub: SubStruct{data: null}
        };
    }
}
