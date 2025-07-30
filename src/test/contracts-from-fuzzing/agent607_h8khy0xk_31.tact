struct HasBool {
    flag: Bool;
}

struct HasString {
    text: String;
}

contract ManyStructs {
    s1: HasBool;
    s2: HasString;
    s3: HasBool;

    init() {
        self.s1=HasBool{ flag:true };
        self.s2=HasString{ text:"hi" };
        self.s3=HasBool{ flag:false };
    }
}