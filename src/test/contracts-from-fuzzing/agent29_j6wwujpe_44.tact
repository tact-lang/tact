struct StringOpt {
    s: String?;
}

contract StringOptContract {
    saved: StringOpt;

    init() {
        self.saved = StringOpt{s:null};
    }
}