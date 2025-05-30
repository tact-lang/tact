struct StringNest {
    inner: StringInner;
}

struct StringInner {
    val: String;
}

contract PersistStringDeep {
    sf: StringNest;

    init() {
        self.sf = StringNest{
            inner: StringInner{
                val: "deepstring"
            }
        };
    }
}