struct StringOptD {
    opt: StringOpt?;
}

struct StringOpt {
    s: String?;
}

contract StringOptNestedContract {
    saved: StringOptD;

    init() {
        self.saved = StringOptD{
            opt:null
        };
    }
}