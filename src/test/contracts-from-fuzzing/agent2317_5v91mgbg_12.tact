struct BigStrings {
    txt1: String = "one";
    txt2: String = "two";
    txt3: String = "three";
    txt4: String = "four";
}

contract TextContract {
    big: BigStrings;

    init() {
        self.big = BigStrings{
            txt1: "eleven",
            txt2: "twelve",
            txt3: "thirteen",
            txt4: "fourteen"
        };
    }
}