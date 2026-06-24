// Struct with many Strings & Bools, defaults mixed
struct Mix {
    s1: String = "";
    b1: Bool;
    s2: String;
    b2: Bool = false;
    s3: String = "abc";
    b3: Bool;
}

contract MixContract {
    m: Mix;

    init() {
        self.m = Mix{
            s1:"hello",
            b1:true,
            s2:"world",
            b2:true,
            s3:"xyz",
            b3:false
        };
    }
}