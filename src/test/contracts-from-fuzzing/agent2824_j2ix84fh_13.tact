struct W { a: Int; b: Bool }
struct X { y: W; z: Int? }
struct Y { x: X? }
struct Z { y: Y }

contract MixNestOptional {
    data: Z;

    init() {
        self.data = Z{ y: Y{ x: null } };
    }
}