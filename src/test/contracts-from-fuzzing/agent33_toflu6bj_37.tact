struct OptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract TestContract {
    val: OptStrings;

    init() {
        self.val = OptStrings{
            s1:null,s2:null,s3:null,s4:null,s5:null
        };
    }
}