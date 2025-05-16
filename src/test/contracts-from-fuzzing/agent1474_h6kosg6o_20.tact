contract DeeplyNestedOptionalTest {
    s: S?;
    init() {
        self.s = null;
    }
}

struct S {
    next: S2?;
}

struct S2 {
    next: S3?;
}

struct S3 {
    next: S4?;
}

struct S4 {
    leaf: Int?;
}
