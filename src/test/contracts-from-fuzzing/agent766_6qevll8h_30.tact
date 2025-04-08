// test long chain of nested structs all optional
struct S5 { val: Int; }
struct S4 { next: S5?; }
struct S3 { next: S4?; }
struct S2 { next: S3?; }
struct S1 { next: S2?; }

contract Test {
    root: S1;

    init() {
        self.root = S1{ next: S2{ next: S3{ next: S4{ next: S5{ val: 7 } } } } };
    }
}