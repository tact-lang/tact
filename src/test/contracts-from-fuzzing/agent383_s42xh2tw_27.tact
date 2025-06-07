struct Alpha { x:Int }
struct Beta { y:Bool }
struct Gamma { z:String }

struct TopLevel {
    fst: Alpha;
    snd: Beta;
    trd: Gamma;
}

contract MultiTypes {
    data: TopLevel;
    init() {
       self.data = TopLevel{
           fst: Alpha{ x:123 },
           snd: Beta{ y:true },
           trd: Gamma{ z:"zzz" }
       };
    }
}