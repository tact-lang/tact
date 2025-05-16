// Persisting large composite data made of nested structs and optionals
struct Sub {
    x: Int;
    y: Bool?;
    z: String;
}

struct Middle {
    left: Sub;
    right: Sub?;
    note: String;
}

struct Root {
    m1: Middle;
    m2: Middle;
    flag: Bool;
}

contract LargeComposite {
    comp: Root;

    init() {
        self.comp = Root{
            m1: Middle{
                left: Sub{ x: 1, y: null, z: "z" },
                right: null,
                note: "note1",
            },
            m2: Middle{
                left: Sub{ x: 2, y: true, z: "zz" },
                right: Sub{ x: 3, y: false, z: "zzz" },
                note: "note2",
            },
            flag: false,
        };
    }

    receive() {
        self.comp = self.comp;
    }
}