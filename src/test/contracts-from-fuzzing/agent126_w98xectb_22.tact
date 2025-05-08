struct Rep { s1: String; s2: String; s3: String; s4: String; }

contract RepeatStr {
    r1: Rep;
    r2: Rep;

    init() {
        self.r1 = Rep{ s1:"a", s2:"b", s3:"c", s4:"d" };
        self.r2 = Rep{ s1:"e", s2:"f", s3:"g", s4:"h" };
    }
}