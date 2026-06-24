struct IntsAndStrings {
    n1: Int; n2: Int; s1: String; s2: String;
    n3: Int; s3: String; n4: Int; s4: String;
}

contract TestContract {
    data: IntsAndStrings;

    init() {
        self.data = IntsAndStrings{
            n1:1,n2:2,s1:"a",s2:"b",
            n3:3,s3:"c",n4:4,s4:"d"
        };
    }
}