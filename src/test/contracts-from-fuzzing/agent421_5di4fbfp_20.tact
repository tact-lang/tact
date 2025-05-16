struct BoolWrap { x: Bool; y: Bool; z: Bool; }

contract TinyBits {
    data: BoolWrap;

    init() {
        self.data = BoolWrap{ x:true, y:false, z:true };
    }
}