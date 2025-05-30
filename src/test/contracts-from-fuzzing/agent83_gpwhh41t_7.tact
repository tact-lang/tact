struct VeryDeepLevel1 { val: Int; }
struct VeryDeepLevel2 { nested: VeryDeepLevel1; }
struct VeryDeepLevel3 { nested: VeryDeepLevel2; }
struct VeryDeepLevel4 { nested: VeryDeepLevel3; }
struct VeryDeepLevel5 { nested: VeryDeepLevel4; }
struct VeryDeepLevel6 { nested: VeryDeepLevel5; }
struct VeryDeepLevel7 { nested: VeryDeepLevel6; }

contract Depth7 {
    record: VeryDeepLevel7;
    init() {
        self.record = VeryDeepLevel7{
            nested: VeryDeepLevel6{
                nested: VeryDeepLevel5{
                    nested: VeryDeepLevel4{
                        nested: VeryDeepLevel3{
                            nested: VeryDeepLevel2{
                                nested: VeryDeepLevel1{ val: 123 }
                            }
                        }
                    }
                }
            }
        };
    }
}
