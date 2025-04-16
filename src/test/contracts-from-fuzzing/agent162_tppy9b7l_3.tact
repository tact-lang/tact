struct SubLevel1 {
    val: Int;
}
struct SubLevel2 {
    nested: SubLevel1;
}
struct SubLevel3 {
    nested: SubLevel2;
}
struct SubLevel4 {
    nested: SubLevel3;
}

contract DeepNestTest {
    testField: SubLevel4;
    init() {
        self.testField = SubLevel4{
            nested: SubLevel3{
                nested: SubLevel2{
                    nested: SubLevel1{
                        val: 17,
                    },
                },
            },
        };
    }
}