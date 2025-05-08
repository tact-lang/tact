struct NestedPoint { x: Int; y: Int; }

contract DeepPersistence {
    point: NestedPoint;  
    
    init() {
        self.point = NestedPoint{ x: 1, y: 2 };
    }
}