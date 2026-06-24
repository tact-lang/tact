struct Alpha {
    v: Int;
}

struct Beta {
    v: Int;
}

struct Outer {
    a: Alpha?;
    b: Beta?;
}

contract NullablesMultipleTypes {
    data: Outer;

    init() {
        self.data = Outer{
            a: Alpha{ v: 1 },
            b: null
        };
    }
}