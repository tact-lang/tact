struct Info { a: Int; b: Bool; }

contract Punned {
    data: Info;

    init() {
        let a = 5;
        let b = false;
        self.data = Info{ a, b };
    }
}