struct Deep {
    a: Int?;
    b: Bool?;
}

struct Shallow {
    d: Deep?;
    label: String?;
}

contract Test {
    obj: Shallow;

    init() {
        self.obj = Shallow{};  // nested optionals default to null
    }
}