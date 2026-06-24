struct InnerMost { x: Int; y: Bool; opt: String?; }

struct MidLevel { field: InnerMost; flag: Bool; }

struct TopTier { m1: MidLevel; m2: MidLevel; }

contract DeeplyNested {
    store: TopTier;
    
    init() {
        self.store = TopTier{
            m1: MidLevel{ field: InnerMost{x:1,y:true,opt:null}, flag: true },
            m2: MidLevel{ field: InnerMost{x:2,y:false,opt:null}, flag: false }
        };
    }
}