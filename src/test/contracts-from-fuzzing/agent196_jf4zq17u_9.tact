struct Compose1 {
    x: Int;
}

struct Compose2 {
    y: Bool;
    z: Compose1;
}

struct Compose3 {
    w: Compose2;
    k: Int;
}

contract DeepComposeContract {
    val: Compose3;

    init() {
        self.val = Compose3{
            w: Compose2{ y: false, z: Compose1{x: 99} },
            k: 77,
        };
    }
}