struct RecLev1 {
    lev2: RecLev2;
}

struct RecLev2 {
    lev3: RecLev3;
}

struct RecLev3 {
    num: Int;
    flag: Bool;
    maybeStr: String?;
}

contract RecursiveFields {
    rec: RecLev1;

    init() {
        self.rec = RecLev1{
            lev2: RecLev2{
                lev3: RecLev3{
                    num: 42,
                    flag: false,
                    maybeStr: null
                }
            }
        };
    }
}