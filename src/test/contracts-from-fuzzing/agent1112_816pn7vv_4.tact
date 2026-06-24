struct Depth3 {
    child: Depth2;
}

struct Depth2 {
    child: Depth1;
}

struct Depth1 {
    value: Int;
}

contract Test {
    val: Depth3;
    init() {
        self.val = Depth3{child: Depth2{child: Depth1{value: 5}}};
    }
}