struct InnerStruct { a: Int }
struct OuterStruct { in1: InnerStruct; in2: InnerStruct }

contract DuplicateStructTest {
    os: OuterStruct;

    init() {
        self.os = OuterStruct { in1: InnerStruct{a:5}, in2: InnerStruct{a:10} };
    }
}