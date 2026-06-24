struct SLevel4 { val: Int }
struct SLevel3 { l4: SLevel4 }
struct SLevel2 { l3: SLevel3 }
struct SLevel1 { l2: SLevel2 }

contract OptionalDeep {
    state: SLevel1?;

    init() {
        self.state = null;
    }
}