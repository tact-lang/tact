struct Mixed {
    small: Int as uint3;
    medium: Int as uint8;
    flag: Bool;
    optionalData: Int?; 
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            small: 7,
            medium: 200,
            flag: true,
            optionalData: null
        };
    }
}