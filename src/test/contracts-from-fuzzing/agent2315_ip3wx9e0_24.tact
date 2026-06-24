struct BoolNest { b1: Bool; b2: Bool?; }

struct RecNest { x: BoolNest; y: BoolNest; }

contract ReusedStructs {
    one: RecNest;
    two: RecNest;

    init() {
        self.one = RecNest{
            x: BoolNest{ b1:true, b2:null },
            y: BoolNest{ b1:false, b2:true }
        };
        self.two = RecNest{
            x: BoolNest{ b1:false, b2:true },
            y: BoolNest{ b1:true, b2:null }
        };
    }
}