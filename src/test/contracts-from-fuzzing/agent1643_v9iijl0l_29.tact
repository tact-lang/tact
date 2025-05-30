struct CompactInt {
    tiny: Int as uint4;
}

contract SerializedTinyInt {
    tinyHolder: CompactInt;
    
    init() {
        self.tinyHolder = CompactInt{ tiny: 15 };
    }
}
