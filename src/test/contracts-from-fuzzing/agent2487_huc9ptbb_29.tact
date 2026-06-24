struct OneOptional {
    a: Int?;
}

struct TwoOptionals {
    a: Int?;
    b: Bool?;
}

struct ThreeOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    one: OneOptional?;
    two: TwoOptionals?;
    three: ThreeOptionals?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
    }
}