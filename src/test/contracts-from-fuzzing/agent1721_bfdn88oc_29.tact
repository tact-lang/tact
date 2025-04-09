// test with persistent struct containing many strings
struct MultiStringStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StringHeavyContract {
    data: MultiStringStruct;
    init() {
        self.data = MultiStringStruct {
            s1:"a", s2:"b", s3:"c", s4:"d", s5:"e"
        };
    }
}
