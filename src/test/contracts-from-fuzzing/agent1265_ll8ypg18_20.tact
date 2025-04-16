struct OddSerialization {
    tiny: Int as uint3; // fits in 3 bits
    small: Int as int5; // 5 bits signed
    large: Int as uint250; // nearly max size
}

contract SerializeEdge {
    data: OddSerialization;
    init() {
        self.data = OddSerialization{
            tiny: 7, small: -5, large: 12345678901234567890
        };
    }
}