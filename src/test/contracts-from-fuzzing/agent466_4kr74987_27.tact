struct Alpha { i: Int; } 
struct Beta { b: Bool; } 
struct Gamma { s: String; } 

struct Mix {
    a: Alpha;
    b: Beta;
    c: Gamma;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract MixedNestedOptionals {
    state: Mix;

    init() {
        self.state = Mix{
            a: Alpha{i:1},
            b: Beta{b:true},
            c: Gamma{s:"g"},
            optInt: null, optStr:null, optBool:null
        };
    }
}