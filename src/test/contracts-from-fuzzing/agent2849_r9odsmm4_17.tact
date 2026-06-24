struct SubA { v: Int }
struct SubB { a: SubA }

contract MutuallyRecursive {
    a: SubA;
    b: SubB;

    init() {
        self.a = SubA{v:1};
        self.b = SubB{a: SubA{v:2} };
    }
}