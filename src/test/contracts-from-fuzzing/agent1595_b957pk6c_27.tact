// deeply nested contract field containing multiple optional and primitive fields
struct Leaf { x: Int?; y: String?; z: Bool; }
struct Mid { a: Int; b: Leaf; }
struct Top { m: Mid; flag: Bool; }

contract TestContract {
    storage: Top;
    init() {
        self.storage = Top{
            m: Mid{a:123, b:Leaf{x:null,y:"yyy",z:true}},
            flag: false
        };
    }
}