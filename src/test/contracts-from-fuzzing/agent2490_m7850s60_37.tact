struct HasStringBool {
    s: String;
    b: Bool;
}

contract StrBoolContract {
    data: HasStringBool;

    init() {
        self.data = HasStringBool{s:"hi",b:true};
    }
}