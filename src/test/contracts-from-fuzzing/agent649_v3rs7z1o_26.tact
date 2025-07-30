struct NestedBoolStr {
    flag: Bool;
    text: String?;
}

contract BoolStrOptContract {
    x: NestedBoolStr;

    init() {
        self.x = NestedBoolStr{ flag:true, text:null };
    }
}