// Mix optional structs with default null and provided value
struct Bar { x: Int }

struct TestStruct {
    a: Bar?;
    b: Bar? = null;
}

contract MixOptStructs {
    data: TestStruct;
    init() {
        self.data = TestStruct{
            a: null,
            b: null
        };
    }
}