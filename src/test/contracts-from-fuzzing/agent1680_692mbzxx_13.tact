struct ManyStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
}

contract StringPersist {
    data: ManyStrings = ManyStrings{ s1:"1", s2:"2", s3:"3", s4:"4", s5:"5" };
    receive() {}
}