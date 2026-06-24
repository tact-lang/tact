struct S1 { a: Int; }
struct S2 { s: S1; n: Int; }
struct S3 { s2: S2; flag: Bool; opt: Int?; txt: String; }

contract Test3 {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{ s: S1{ a: 10 }, n: 20 },
            flag: true,
            opt: null,
            txt: "deep",
        };
    }
}