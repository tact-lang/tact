struct ChainLevel1 { next: ChainLevel2; }
struct ChainLevel2 { next: ChainLevel3; }
struct ChainLevel3 { next: ChainLevel4; }
struct ChainLevel4 { next: ChainLevel5; }
struct ChainLevel5 { val: Int; }

contract DeepChainContract {
    chain: ChainLevel1 = ChainLevel1{
        next: ChainLevel2{
            next: ChainLevel3{
                next: ChainLevel4{
                    next: ChainLevel5{ val: 999 }
                }
            }
        }
    };
}