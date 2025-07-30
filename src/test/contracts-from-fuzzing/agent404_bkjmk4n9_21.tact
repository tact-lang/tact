struct Strs {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringsTest {
    ss: Strs;
    init() {
        self.ss = Strs{s1:"a",s2:"b",s3:"c",s4:"d"};
    }
}