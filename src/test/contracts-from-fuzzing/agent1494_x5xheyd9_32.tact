// Here test optional of struct with nested optional inside
struct NestedOptInStruct {
    i: Int?;
}

struct Wrapper {
    inner: NestedOptInStruct?;
}

contract NestedOptionalStructField {
    val: Wrapper;

    init() {
        self.val = Wrapper{ inner: null };
    }
}