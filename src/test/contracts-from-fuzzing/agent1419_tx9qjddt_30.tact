struct NestedS1 { a: Int; }
struct NestedS2 { s1: NestedS1; }
struct NestedS3 { s2: NestedS2; }
struct NestedS4 { s3: NestedS3; }

contract Nested4Structs {
    data: NestedS4;

    init() {
        self.data = NestedS4{
            s3: NestedS3{
                s2: NestedS2{
                    s1: NestedS1{ a: 42 }
                }
            }
        };
    }
}