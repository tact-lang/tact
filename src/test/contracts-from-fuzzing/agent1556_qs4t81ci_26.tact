// optional struct field at contract level, optional itself has nested optional
struct Nested {
    a: Int?;
}

contract TestContract {
    st: Nested?;

    init() {
        self.st = Nested{a:null};
    }

    receive() {
        let _ = self.st;
    }
}