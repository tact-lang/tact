struct Layer3 { leaf: Int?; }
struct Layer2 { middle: Layer3?; }
struct Layer1 { root: Layer2?; }

contract TestContract {
    data: Layer1;

    init() {
        self.data = Layer1{
            root: null
        };
    }
}