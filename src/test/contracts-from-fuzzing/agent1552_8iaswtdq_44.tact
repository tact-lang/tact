struct Base {
    a: Int;
    b: Bool;
}

struct Mid {
    m: Base;
    x: String;
}

struct Top {
    t: Mid;
    y: Int;
}

contract ThreeLevel {
    deep: Top;

    init() {
        self.deep = Top{
            t: Mid{m: Base{a:5,b:true}, x:"foo"},
            y:99
        };
    }
}