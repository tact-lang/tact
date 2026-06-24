struct LongStringStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
    s9: String;
    s10: String;
}

contract LongStrTest {
    fld: LongStringStruct = LongStringStruct{
        s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",s6:"f",s7:"g",s8:"h",s9:"i",s10:"j"
    };

    init() {
        self.fld = LongStringStruct{
            s1:"1",s2:"2",s3:"3",s4:"4",s5:"5",s6:"6",s7:"7",s8:"8",s9:"9",s10:"10"
        };
    }
}