struct Left {
    opt: Int?;
    txt: String;
}
struct Right {
    flag: Bool;
    optStr: String?;
}

struct Both {
    l: Left;
    r: Right;
}

contract BothStructs {
    b: Both;

    init() {
        self.b = Both{
            l: Left{ opt: null, txt: "x"},
            r: Right{ flag: true, optStr: null}
        };
    }
}