message(42) Note { val: String }

struct Container {
    note: Note?;
}

struct Wrapper {
    cont: Container?;
}

contract Test31 {
    allopt: Wrapper?;

    init() {
        self.allopt = null;
    }
}
