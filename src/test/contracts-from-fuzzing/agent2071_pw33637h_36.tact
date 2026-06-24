struct DU {
    a:Int?;b:Bool?;c:String?;
}

struct WR {
    inn: DU?;
}

contract EdgeOpt {
    x: WR;

    init() {
        self.x = WR{ inn: null };
    }
}