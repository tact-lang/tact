struct AnnotatedStruct {
    small: Int as uint4;
    medium: Int as uint16;
    large: Int as uint256;
    flag: Bool;
}

contract AnnotatedStructTest {
    s: AnnotatedStruct;
    
    init() {
        self.s = AnnotatedStruct{
            small: 8,
            medium: 512,
            large: 123456789,
            flag: true
        };
    }
}