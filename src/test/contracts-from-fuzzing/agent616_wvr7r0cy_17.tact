struct ContainsStringOptional {
    s1: String;
    s2: String?;
}

contract Stratified {
    f: ContainsStringOptional;

    init() {
        self.f = ContainsStringOptional{
            s1:"abc",
            s2:null
        };
    }
}