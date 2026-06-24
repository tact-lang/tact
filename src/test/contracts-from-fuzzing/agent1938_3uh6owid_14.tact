struct TextWrap {
    t1: String;
    t2: String;
    t3: String;
    t4: String;
    t5: String;
    t6: String;
    t7: String;
    t8: String;
    t9: String;
    t10: String;
}

contract TextWrapTest {
    data: TextWrap;

    init() {
        self.data = TextWrap{
            t1:"a",t2:"b",t3:"c",t4:"d",t5:"e",t6:"f",t7:"g",t8:"h",t9:"i",t10:"j"
        };
    }
}