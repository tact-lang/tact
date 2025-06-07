struct GroupA { a:Int; b:Int }
struct GroupB { c:Bool; d:Bool }

struct Combo {
  g1:GroupA;
  g2:GroupB;
  label:String;
}

contract WithGroups {
    s: Combo;
    init() {
        self.s = Combo{
            g1: GroupA{ a:1, b:2 },
            g2: GroupB{ c:true, d:false },
            label: "hi"
        };
    }
}