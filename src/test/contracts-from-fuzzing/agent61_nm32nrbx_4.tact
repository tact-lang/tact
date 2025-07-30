struct Layer3 { val: Int }
struct Layer2 { in3: Layer3 }
struct Layer1 { in2: Layer2 }

contract TestContract {
    deepNest: Layer1;

    init() {
        self.deepNest = Layer1{ in2: Layer2{ in3: Layer3{ val: 256 }}};
    }
}