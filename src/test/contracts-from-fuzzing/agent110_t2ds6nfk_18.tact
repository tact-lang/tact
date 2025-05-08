struct Blob {
    dat: Cell;
    txt: String;
}

struct Wrapper {
    inside: Blob;
    flag: Bool;
}

contract Storage {
    state: Wrapper;
    init() {
        self.state = Wrapper{inside: Blob{dat: emptyCell(), txt:"x"}, flag:true};
    }
}