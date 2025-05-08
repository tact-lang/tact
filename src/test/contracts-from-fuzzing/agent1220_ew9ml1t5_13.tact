struct DeeplyNestedOptional {
    optStruct: SOpt?;
}

struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptStructTest {
    data: DeeplyNestedOptional;

    init() {
        self.data = DeeplyNestedOptional{
            optStruct: null
        };
    }
}