struct S1 { a: Int }
struct S2 { a: Int }
struct S3 { x: S1; y: S2 }

contract SimilarNested {
    data: S3;

    init() {
        self.data = S3{
            x: S1{ a: 4 },
            y: S2{ a: 5 }
        };
    }
}