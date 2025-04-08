struct SLevel3 { x: Int; y: Bool; z: String }
struct SLevel2 { inside: SLevel3; flag: Bool; comment: String }
struct SLevel1 { inner: SLevel2; count: Int }

contract DeepNestedTest {
    field: SLevel1;
    optField: SLevel1?;

    init() {
        self.field = SLevel1{
            inner: SLevel2{
                inside: SLevel3{ x: 1, y: true, z: "ok" },
                flag: false,
                comment: "hi"
            },
            count: 10
        };
        self.optField = null;
    }
}