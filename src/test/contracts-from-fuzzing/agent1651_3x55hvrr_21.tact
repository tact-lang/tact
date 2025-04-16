struct Depth1 {
    f: Int;
}

struct Depth2 {
    d1: Depth1;
}

struct Depth3 {
    d2: Depth2;
}

struct Depth4 {
    d3: Depth3;
}

struct Depth5 {
    d4: Depth4;
}

contract Test21 {
    val: Depth5;

    init() {
        self.val = Depth5{ d4: Depth4{ d3: Depth3{ d2: Depth2{ d1: Depth1{ f: 100 } } } } };
    }
}
