// very deep nested optional chain
struct S1 { x: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }
struct S4 { s3: S3?; }
contract DeepNestedOptBranch {
    root: S4?;
    init() {
        self.root = null;
    }
}