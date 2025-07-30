struct Sibling1 { a: Int? }
struct Sibling2 { b: Bool? }
struct Sibling3 { c: String? }

struct Parent {
    s1: Sibling1?;
    s2: Sibling2?;
    s3: Sibling3?;
}

contract MultiNestedOptions {
    p: Parent?;

    init() {
        self.p = null;
    }

    receive() {
        let _ = self.p;
    }
}