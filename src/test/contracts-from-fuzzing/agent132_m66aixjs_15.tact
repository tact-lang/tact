// Test long chain of nested optionals
struct S3 { value: Int?; }
struct S2 { mid: S3?; }
struct S1 { first: S2?; }

contract Chain {
    root: S1?;

    init() {
        self.root = S1{
            first: S2{
                mid: S3{
                    value: null,
                },
            },
        };
    }
}