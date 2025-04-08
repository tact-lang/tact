struct Nester1 {
    val: Int;
}

struct Nester2 {
    n1: Nester1;
    flag: Bool;
}

struct Nester3 {
    n2: Nester2;
    text: String;
}

contract DeepNester {
    content: Nester3;

    init() {
        self.content = Nester3{
            n2: Nester2{ n1: Nester1{ val: 5 }, flag: true },
            text: "deep"
        };
    }
}