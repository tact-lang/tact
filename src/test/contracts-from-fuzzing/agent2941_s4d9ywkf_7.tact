struct CString {
    text: String;
}

struct CStringOpt {
    field1: CString?;
    field2: String?;
}

contract StringOptionTest {
    storage: CStringOpt;

    init() {
        self.storage = CStringOpt{
            field1: null,
            field2: null,
        };
    }
}