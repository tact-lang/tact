struct Levels3 {
    x: Int;
    y: Bool;
}

struct Levels2 {
    nested: Levels3;
    z: Int;
}

struct Levels1 {
    inner: Levels2;
    flag: Bool;
}

contract ThreeDeep {
    data: Levels1;

    init() {
        self.data = Levels1{
            inner: Levels2{ nested: Levels3{ x: 5, y: true }, z: 12 },
            flag: false
        };
    }
}