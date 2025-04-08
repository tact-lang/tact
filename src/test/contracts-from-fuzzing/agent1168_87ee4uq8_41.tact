struct InnerOne { x: Int }
struct InnerTwo { y: Bool }

contract TwoStructs {
    s1: InnerOne;
    s2: InnerTwo;

    init() {
        self.s1 = InnerOne{ x: 3 };
        self.s2 = InnerTwo{ y: false };
    }
}