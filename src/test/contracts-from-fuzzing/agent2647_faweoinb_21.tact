struct OnlyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract OnlyOptionalsContract {
    val: OnlyOptionals;

    init() {
        self.val = OnlyOptionals{
            oi: null,
            ob: null,
            os: null
        };
    }
}