struct Deep {
    nested1: Inner1;
}

struct Inner1 {
    nested2: Inner2;
}

struct Inner2 {
    x: Int?;
    y: Bool;
}

contract DeepStructOptional {
    f: Deep;

    init() {
        self.f = Deep{ nested1: Inner1{ nested2: Inner2{ x:null, y:true } } };
    }
}