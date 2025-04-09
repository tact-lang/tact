struct DeepLevel3 {
    num: Int;
    flag: Bool;
}

struct DeepLevel2 {
    inner: DeepLevel3;
    comment: String;
}

struct DeepLevel1 {
    inner: DeepLevel2;
    active: Bool;
}

contract DeepNestedTest {
    state: DeepLevel1;

    init() {
        self.state = DeepLevel1{
            inner: DeepLevel2{
                inner: DeepLevel3{
                    num: 123,
                    flag: false,
                },
                comment: "Deepest"
            },
            active: true
        };
    }
}