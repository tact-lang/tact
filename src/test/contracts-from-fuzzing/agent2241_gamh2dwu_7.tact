struct NestedArray {
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

struct Holder {
    a: NestedArray;
    b: NestedArray;
    c: NestedArray;
}

contract BigStructsInStorage {
    val: Holder;

    init() {
        self.val = Holder{
            a: NestedArray{
                s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
                s6:"f",s7:"g",s8:"h",s9:"i",s10:"j"
            },
            b: NestedArray{
                s1:"k",s2:"l",s3:"m",s4:"n",s5:"o",
                s6:"p",s7:"q",s8:"r",s9:"s",s10:"t"
            },
            c: NestedArray{
                s1:"u",s2:"v",s3:"w",s4:"x",s5:"y",
                s6:"z",s7:"1",s8:"2",s9:"3",s10:"4"
            }
        };
    }
}