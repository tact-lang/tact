struct SubInner {
    val: Int as uint32;
    status: Bool?;
}

struct SubOuter {
    part: SubInner;
    note: String?;
}

contract NestedSerialOptTest {
    data: SubOuter;

    init() {
        self.data = SubOuter{
            part: SubInner{ val: 42, status: true },
            note: null
        };
    }
}