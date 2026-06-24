// multi-nesting with optionals
struct S1 { f1: Int?; f2: S2?; }
struct S2 { f3: Bool; f4: S3; }
struct S3 { f5: Bool?; f6: String; }

contract MultiNestOpt {
    data: S1;
    init() {
        self.data = S1{
            f1: null,
            f2: null,
        };
    }
}
