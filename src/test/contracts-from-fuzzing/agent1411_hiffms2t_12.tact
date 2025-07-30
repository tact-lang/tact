// testing struct inheritance with optional fields
trait BaseData { x: Int; y: Int? }

contract TestContract with BaseData {
    x: Int;
    y: Int?;

    init() {
        self.x = 10;
        self.y = null;
    }
}