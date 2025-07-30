struct SLevel1 { i: Int }
struct SLevel2 { s1: SLevel1 }
struct SLevel3 { s2: SLevel2 }
struct SLevel4 { s3: SLevel3 }
struct SLevel5 { s4: SLevel4 }

contract NestedStructOptional {
    value: SLevel5?;

    init() {
        self.value = null;
    }
}