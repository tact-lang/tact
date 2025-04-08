struct SLevel1 { f: Int; }
struct SLevel2 { s: SLevel1; }
struct SLevel3 { s: SLevel2; }
struct SLevel4 { s: SLevel3; }
struct SLevel5 { s: SLevel4; }
struct SLevel6 { s: SLevel5; }
struct SLevel7 { s: SLevel6; }

contract SevenNestedStructs {
    val: SLevel7;
    init() {
        self.val = SLevel7{
            s: SLevel6{
                s: SLevel5{
                    s: SLevel4{
                        s: SLevel3{
                            s: SLevel2{
                                s: SLevel1{
                                    f: 777
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}