struct S1 { x: Int; }
struct S2 { a: Int; b: S1; }
struct S3 { k: S2; v: Int?; }

contract ContractWithDeepNesting {
    deep: S3;

    init() {
        self.deep = S3{
            k: S2{ a: 5, b: S1{ x: 3 } },
            v: null
        };
    }
}