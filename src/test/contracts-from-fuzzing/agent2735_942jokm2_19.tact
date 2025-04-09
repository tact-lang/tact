struct SecondLevel {
    f1:Int; f2:Bool; f3:String;
}

struct FirstLevel {
    s1:SecondLevel;
    s2:SecondLevel;
    optionalS: SecondLevel?;
}

contract MultiMulti {
    storage: FirstLevel;

    init() {
        self.storage = FirstLevel{
            s1:SecondLevel{f1:1,f2:true,f3:"one"},
            s2:SecondLevel{f1:2,f2:false,f3:"two"},
            optionalS:null,
        };
    }
}
