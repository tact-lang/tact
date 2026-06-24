struct SLevel3 { val: Int }
struct SLevel2 { s3: SLevel3 }
struct SLevel1 { s2: SLevel2 }

contract Nested3Levels {
    root: SLevel1;

    init() {
        self.root = SLevel1{ s2: SLevel2{ s3: SLevel3{ val: 42 } } };
    }
}