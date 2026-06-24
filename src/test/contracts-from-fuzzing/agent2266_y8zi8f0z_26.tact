struct AA{ p:Int }
struct BB{ q:Int; r:String }
struct CC{ s:Bool; t:Int? }

struct Mega {
    a: AA;
    b: BB;
    c: CC;
    s: String;
    opt: String?;
}

contract Test {
    m: Mega;

    init() {
        self.m = Mega{
            a: AA{p:1},
            b: BB{q:2, r:"r"},
            c: CC{s:true,t:null},
            s: "ok",
            opt: null,
        };
    }
}
