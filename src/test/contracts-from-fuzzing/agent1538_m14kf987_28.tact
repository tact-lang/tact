struct Nest3 {
    deepOpt: Int? = null;
}

struct Nest2 {
    midOpt: Nest3?;
}

struct Nest1 {
    topOpt: Nest2?;
}

contract TestContract {
    nested: Nest1;

    init() {
        self.nested = Nest1{ topOpt: null };
    }
}