struct CompositeOne {
    x: Int;
    y: Bool;
}

struct CompositeTwo {
    a: Int?;
    b: Bool?;
    c: CompositeOne;
}

contract TestContract {
    first: CompositeOne;
    second: CompositeTwo;

    init() {
        self.first = CompositeOne{ x: 10, y: false };
        self.second = CompositeTwo{ a: null, b: true, c: self.first };
    }
}