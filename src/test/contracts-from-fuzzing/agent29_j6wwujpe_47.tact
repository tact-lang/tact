struct OptStrBool {
    s:String?;
    b:Bool?;
}

contract OptStrBoolContract {
    saved:OptStrBool;

    init() {
        self.saved = OptStrBool{s:null,b:true};
    }
}