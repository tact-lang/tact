struct MyString {
    s: String;
    optS: String?;
}

contract StringStore {
    my: MyString;
    init() {
        self.my = MyString{s: "X", optS: null};
    }
}