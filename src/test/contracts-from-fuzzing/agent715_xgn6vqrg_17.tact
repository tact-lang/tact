struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
}

contract TestContract {
    textData: LargeStrings;

    init() {
        self.textData = LargeStrings{
            s1: "a", s2: "b", s3:"c", s4:"d",
            s5: "e", s6:"f", s7:"g", s8:"h"
        };
    }
}