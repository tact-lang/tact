struct S1 { x: Int }
struct S2 { s:S1 }
struct S3 { s:S2 }
struct S4 { s:S3 }
struct S5 { s:S4 }

contract DeepNestedOptional {
    data: S5?;

    init() {
        self.data = null;
    }
}