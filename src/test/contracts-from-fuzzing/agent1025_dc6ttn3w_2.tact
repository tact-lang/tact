struct DeeplyNestedLevel2 {
    evenDeeper: DeeplyNestedLevel3;
    b: Bool;
}

struct DeeplyNestedLevel3 {
    msg: String;
}

struct DeeplyNestedLevel1 {
    a: Int;
    nested: DeeplyNestedLevel2;
}

contract NestedDeepTest {
    complex: DeeplyNestedLevel1;

    init() {
        self.complex = DeeplyNestedLevel1{
            a: 10,
            nested: DeeplyNestedLevel2{
                b: false,
                evenDeeper: DeeplyNestedLevel3{
                    msg: "hello",
                }
            }
        };
    }
}