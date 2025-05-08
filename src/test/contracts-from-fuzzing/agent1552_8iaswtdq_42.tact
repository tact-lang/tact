struct OptStrBool {
    str: String?;
    b: Bool?;
    i: Int;
}

contract OptStrBoolTest {
    f: OptStrBool;

    init() {
        self.f = OptStrBool{str:null,b:true,i:7};
    }
}