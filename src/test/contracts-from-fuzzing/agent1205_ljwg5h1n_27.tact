struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    s: WithStrings;
    
    init() {
        self.s = WithStrings{s1:"1", s2:"2", s3:"3"};
    }
}