struct ManyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestContract {
    optStrs: ManyOptionalStrings = ManyOptionalStrings{ s1:null,s2:"hi",s3:null };
}