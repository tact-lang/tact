struct SSub {
    value: Int;
    valid: Bool;
}

struct SMid {
    sub1: SSub;
    sub2: SSub;
    str: String;
}

struct STop {
    mid1: SMid;
    mid2: SMid;
    code: Cell;
}

contract Test17 {
    top: STop;
    init() {
        self.top=STop{
            mid1:SMid{sub1:SSub{value:1,valid:true},sub2:SSub{value:2,valid:false},str:"X"},
            mid2:SMid{sub1:SSub{value:3,valid:true},sub2:SSub{value:4,valid:true},str:"Y"},
            code: emptyCell()
        };
    }
}