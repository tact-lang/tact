struct Wrap {
    inside: String;
}

contract MixOptionals {
    wrapOpt: Wrap?;
    txtOpt: String?;
    intOpt: Int?;

    init() {
        self.wrapOpt = null;
        self.txtOpt = null;
        self.intOpt = null;
    }
}