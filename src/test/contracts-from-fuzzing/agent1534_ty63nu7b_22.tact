struct OnlyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
}

contract OnlyOptionalsContract {
    val: OnlyOptionals;
    init() {
        self.val = OnlyOptionals{a:null,b:null,c:null,d:null};
    }
}