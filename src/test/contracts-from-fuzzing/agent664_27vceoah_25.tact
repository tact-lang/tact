struct Layers1 {
    a: Int;
}

struct Layers2 {
    b: Layers1;
}

struct Layers3 {
    c: Layers2;
}

struct Layers4 {
    d: Layers3;
}

struct Layers5 {
    e: Layers4;
}

struct Layers6 {
    f: Layers5;
}

contract DeepLayers {
    data: Layers6;

    init() {
        self.data = Layers6{ f: Layers5{ e: Layers4{ d: Layers3{ c: Layers2{ b: Layers1{ a:1 } } } } } };
    }
}
