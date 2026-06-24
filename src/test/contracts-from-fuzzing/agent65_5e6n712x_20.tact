struct SingleBool {
    b: Bool;
}

struct DeepStruct {
    lvl1: SingleBool;
}

contract SingleBoolNestedTest {
    nested: DeepStruct;

    init() {
        self.nested = DeepStruct{
            lvl1: SingleBool{ b: false }
        };
    }
}
