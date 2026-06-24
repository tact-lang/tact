struct BoolVals { b1: Bool; b2: Bool; b3: Bool; b4: Bool }

contract BoolHeavy {
    data: BoolVals;

    init() {
        self.data = BoolVals{b1:true, b2:false, b3:true, b4:false};
    }

    receive() {}
}