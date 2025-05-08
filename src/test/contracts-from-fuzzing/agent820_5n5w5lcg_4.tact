struct BigNestLevel4 { val: Int }
struct BigNestLevel3 { prev: BigNestLevel4 }
struct BigNestLevel2 { prev: BigNestLevel3 }
struct BigNestLevel1 { prev: BigNestLevel2 }

contract TestContract {
    deep: BigNestLevel1;
    init() {
        self.deep = BigNestLevel1{
            prev: BigNestLevel2{
                prev: BigNestLevel3{
                    prev: BigNestLevel4{
                        val: 100
                    }
                }
            }
        };
    }
}