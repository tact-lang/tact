struct Ints {
    a: Int;
    b: Int;
    c: Int;
}

struct Bools {
    x: Bool;
    y: Bool;
    z: Bool;
}

struct Strings {
    a: String;
    b: String;
    c: String;
}

struct Mix {
    i: Ints;
    b: Bools;
    s: Strings;
}

contract TestContract {
    mix: Mix;

    init() {
        self.mix = Mix{
            i: Ints{a:1,b:2,c:3},
            b: Bools{x:true,y:false,z:true},
            s: Strings{a:"a",b:"b",c:"c"},
        };
    }
}