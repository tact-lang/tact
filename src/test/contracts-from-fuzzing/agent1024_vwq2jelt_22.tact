struct StringVals {
    a: String;
    b: String?;
}

contract StringsContract {
    struc: StringVals;

    init() {
        self.struc = StringVals{a:"abc", b:null};
    }
}