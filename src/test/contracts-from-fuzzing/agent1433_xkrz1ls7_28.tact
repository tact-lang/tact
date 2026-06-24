struct SubA { val: Int }
struct SubB { val: Bool }
struct Super {
    x: SubA;
    y: SubB;
}

contract TestContract {
    superS: Super;
    init() {
        self.superS = Super{
            x: SubA{ val: 5 },
            y: SubB{ val: false },
        };
    }
}