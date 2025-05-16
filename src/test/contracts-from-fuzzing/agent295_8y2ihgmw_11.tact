struct NestedOrder {
    x: Int;
    s: Sub;
    y: Int;
    s2: Sub;
}

struct Sub {
    flag: Bool;
    text: String;
}

contract OrderTest {
    data: NestedOrder;

    init() {
        self.data = NestedOrder{
            x: 1,
            s: Sub{flag:true, text:"hi"},
            y: 2,
            s2: Sub{flag:false, text:"bye"}
        };
    }
}