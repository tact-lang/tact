struct MultiStr {
    s1: String; s2: String; s3: String; s4: String;
    s5: String; s6: String; s7: String; s8: String;
}

contract MultiNestedStrings {
    v1: MultiStr;
    v2: MultiStr;

    init() {
        self.v1 = MultiStr{ s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",s6:"f",s7:"g",s8:"h" };
        self.v2 = MultiStr{ s1:"i",s2:"j",s3:"k",s4:"l",s5:"m",s6:"n",s7:"o",s8:"p" };
    }
}