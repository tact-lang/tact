struct Str1 { f:String }
struct Str2 { f:Int }
struct Str3 { f:Bool }

struct Mid1 { s:Str1; optS:Str2?; }
struct Mid2 { flag:Bool; s2:Str3; }

contract MultiLayered {
    m1: Mid1;
    m2: Mid2;

    init() {
        self.m1 = Mid1{
            s: Str1{f:"ok"},
            optS: null,
        };
        self.m2 = Mid2{
            flag:true,
            s2: Str3{f:false},
        };
    }

    receive() {
        let _ = self.m1;
        let _ = self.m2;
    }
}
