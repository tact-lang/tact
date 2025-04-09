struct SLevel3 { third: Int }
struct SLevel2 { second: SLevel3 }
struct SLevel1 { first: SLevel2 }

contract MixedDeepNested {
    root: SLevel1;

    init() {
        self.root = SLevel1{ first: SLevel2{ second: SLevel3{ third: 11 } } };
    }
}