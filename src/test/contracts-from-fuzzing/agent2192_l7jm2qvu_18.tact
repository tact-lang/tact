struct Info { a: Int; b: Bool; }

contract HasInit {
    val: Info?;

    init() {
        self.val = Info{ a:42, b:true };
    }
}