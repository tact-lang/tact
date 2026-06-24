struct Inner {
    val: Int = 17;
}

struct Middle {
    inn: Inner;
}

contract PersistOptionalStruct {
    mid: Middle?;

    init() {
        self.mid = Middle{
            inn: Inner{}
        };
    }
}